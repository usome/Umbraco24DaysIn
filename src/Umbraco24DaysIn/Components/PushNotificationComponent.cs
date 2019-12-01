using System;
using System.Configuration;
using System.IO;
using System.Net;
using System.Text;
using Umbraco.Core.Composing;
using Umbraco.Core.Logging;
using Umbraco.Core.Models.PublishedContent;
using Umbraco.Core.Services;
using Umbraco.Core.Services.Implement;
using Umbraco.Web;

namespace Umbraco24DaysIn.Components
{
	public class PushNotificationComponent: IComponent
	{
		private readonly ILogger _logger;
		private readonly IContentService _contentService;
		private readonly IUmbracoContextFactory _umbracoContext;
		private UmbracoContext _context;

		public PushNotificationComponent(ILogger logger, IContentService contentService, IUmbracoContextFactory umbracoContext)
		{
			_logger = logger;
			_contentService = contentService;
			_umbracoContext = umbracoContext;
		}

		private bool SendPushNotificationOnPublish { get; } =
			bool.Parse(ConfigurationManager.AppSettings["PushNotificationOnPublish"]);

		private string AppId { get; } =
			ConfigurationManager.AppSettings["OneSignal:appId"];

		private string ApiKey { get; } =
			ConfigurationManager.AppSettings["OneSignal:apiKey"];

		private string ApiUrl { get; } =
			ConfigurationManager.AppSettings["OneSignal:restUrl"];

		private string TitleProperty { get; } =
			ConfigurationManager.AppSettings["pushNotificationTitleProperty"];

		private string ContentProperty { get; } =
			ConfigurationManager.AppSettings["pushNotificationContentProperty"];

		private bool IsAllowedDocType(string documentTypeAlias)
		{
			var allowedDocumentTypes = ConfigurationManager.AppSettings["PushNotificationAllowedTypes"];
			return allowedDocumentTypes.Contains(documentTypeAlias);
		}

		public void Initialize()
		{
			ContentService.Published += ContentService_Published;
		}

		private void ContentService_Published(IContentService sender, Umbraco.Core.Events.ContentPublishedEventArgs e)
		{
			using (var contextReference = _umbracoContext.EnsureUmbracoContext())
			{
				_context = contextReference.UmbracoContext;
			}

			foreach (var item in e.PublishedEntities)
			{
				if (IsAllowedDocType(item.ContentType.Alias))
				{
					var title = item.GetValue(TitleProperty) != null ? item.GetValue<string>(TitleProperty) : item.Name;
					var content = item.GetValue(ContentProperty) != null ? item.GetValue<string>(ContentProperty) : item.Name;
					var url = "";

					if (_context != null)
					{
						var publishedEntity = _context.Content.GetById(item.Id);
						url = publishedEntity.Url(mode: UrlMode.Absolute);
					}
	

					var segments = new string[] { "All" };

					if (SendPushNotificationOnPublish)
					{
						if (PushNotification(title, content, segments, url))
						{
							_logger.Info<PushNotificationComponent>(
								$"Notification sent successfully. Page Details : '{title}' ('{item.Id}')");
						}
						else
						{
							_logger.Warn<PushNotificationComponent>(
								$"Notification send failed. Page Details : '{title}' ('{item.Id}')");
						}
					}
					else
					{
						if (item.GetValue<bool>("sendPushNotification"))
						{
							if (PushNotification(title, content, segments, url))
							{
								item.SetValue("sendPushNotification", false);
								_contentService.SaveAndPublish(item, raiseEvents: false);
								_logger.Info<PushNotificationComponent>(
									$"Notification sent successfully. Page Details : '{title}' ('{item.Id}')");
							}
							else
							{
								_logger.Warn<PushNotificationComponent>(
									$"Notification send failed. Page Details : '{title}' ('{item.Id}')");
							}
						}
					}
				}
			}
		}

		public void Terminate()
		{
			
		}

		private bool PushNotification(string title, string content, string[] segments, string link)
		{
			try
			{
				var request = WebRequest.Create($"{ApiUrl}") as HttpWebRequest;

				request.KeepAlive = true;
				request.Method = "POST";
				request.ContentType = "application/json; charset=utf-8";

				request.Headers.Add("authorization", $"Basic {ApiKey}");

				var serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
				var obj = new
				{
					app_id = AppId,
					headings = new {en = title},
					contents = new {en = content},
					included_segments = segments,
					url = link
				};
				var param = serializer.Serialize(obj);
				var byteArray = Encoding.UTF8.GetBytes(param);

				using (var writer = request.GetRequestStream())
				{
					writer.Write(byteArray, 0, byteArray.Length);
				}

				using (var response = request.GetResponse() as HttpWebResponse)
				{
					if (response != null)
					{
						using (var reader = new StreamReader(response.GetResponseStream()))
						{
							var responseContent = reader.ReadToEnd();
							return !responseContent.Contains("error");
						}
					}
				}
			}
			catch (Exception ex)
			{
				return false;
			}

			return false;
		}
	}
}