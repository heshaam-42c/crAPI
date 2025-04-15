#! /bin/sh

echo "Creating Users..."

# JSON data for the API request 
json_data_user_inbound='{"email": "scanuser@test.com","name": "Scan User","number": "9123219421","password": "scanpassword"}'
json_data_user_attack='{"email": "attackuser@test.com","name": "Attack User","number": "8012418672","password": "scanpassword"}'
json_data_user_dummy='{"email": "dummy@test.com","name": "Dummy User","number": "7029571027","password": "scanpassword"}'

# Invoke the API using curl with POST method and passing the JSON data
api_url="http://localhost:8888/identity/api/auth/signup"

# Save only the response code
# curl_response_inbound=$(curl -s -o /dev/null -w "%{http_code}" -X POST -H "Content-Type: application/json" -d "$json_data_user_inbound" "$api_url")
# curl_response_common=$(curl -s -o /dev/null -w "%{http_code}" -X POST -H "Content-Type: application/json" -d "$json_data_user_common" "$api_url")

# if [ "$curl_response_inbound" == "200" ]; then
#     echo "Inbound User Created"
# else
#     echo "Inbound User Creation Failed, got $curl_response_inbound"
# fi

# if [ "$curl_response_common" == "200" ]; then
#     echo "Common User Created"
# else
#     echo "Common User Creation Failed, got $curl_response_common"
# fi

# DEBUG: Save entire response
curl_response_inbound=$(curl -s -o /dev/null -D - POST -H "Content-Type: application/json" -d "$json_data_user_inbound" "$api_url")
curl_response_attack=$(curl -s -o /dev/null -D - POST -H "Content-Type: application/json" -d "$json_data_user_attack" "$api_url")
curl_response_dummy=$(curl -s -o /dev/null -D - POST -H "Content-Type: application/json" -d "$json_data_user_dummy" "$api_url")

echo "Inbound User \n$curl_response_inbound"
echo "Attack User \n$curl_response_attack"
echo "Dummy User \n$curl_response_dummy"