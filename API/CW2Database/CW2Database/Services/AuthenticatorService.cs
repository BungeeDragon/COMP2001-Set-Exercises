using System;
using System.Net.Http;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;

namespace CW2Database.Services
{
    public class AuthenticatorService
    {
        private readonly HttpClient _httpClient;
        private readonly CW2Database _dbContext;
        private readonly ILogger<AuthenticatorService> _logger;

        public AuthenticatorService(HttpClient httpClient, CW2Database dbContext, ILogger<AuthenticatorService> logger)
        {
            _httpClient = httpClient ?? throw new ArgumentNullException(nameof(httpClient));
            _dbContext = dbContext ?? throw new ArgumentNullException(nameof(dbContext));
            _logger = logger;
        }

        // POST: api/VerifyUser
        [HttpPost("VerifyUser")]
        public async Task<bool> VerifyUserAdmin(UserVerificationRequest userVerificationRequest)
        {
            var verificationRequest = new HttpRequestMessage(HttpMethod.Post, "https://web.socem.plymouth.ac.uk/COMP2001/auth/api/users")
            {
                Content = new StringContent(JsonConvert.SerializeObject(userVerificationRequest), System.Text.Encoding.UTF8, "application/json")
            };

            var verificationResponse = await _httpClient.SendAsync(verificationRequest);

            if (verificationResponse.IsSuccessStatusCode)
            {
                var verificationContent = await verificationResponse.Content.ReadAsStringAsync();
                var verificationData = JsonConvert.DeserializeObject<string[]>(verificationContent);

                // Check if the response is ["Verified", "True"]
                return verificationData != null && verificationData.Length == 2 && verificationData[1] == "True";
            }
            else
            {
                // Log response content for debugging
                var responseContent = await verificationResponse.Content.ReadAsStringAsync();
                _logger.LogError($"Authentication API responded with status {verificationResponse.StatusCode}. Response content: {responseContent}");
            }

            return false;
        }
    }
}
