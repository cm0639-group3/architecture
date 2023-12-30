workspace "Flight-Ticket buying system" {

    model {
        user = person "User" "Flight ticket shopper."

        softwareSystem = softwareSystem "Software System"{
            webApplication = container "Flight-ticket web app" "React" {
                tags "Application"
            }

            email = container "Notification system for subscriptions." "Notifies users on purchases and tracked flights."
            
            api_gateway_api = container "API Gateway" {
                tags "API"
            }

            notifications_service = group "Notifications Service" {
                notifications_service_api = container "Notifications API" {
                    tags "Notifications Service" "API"
                }
                container "Notifications Database" {
                    tags "Notifications Service" "Database"
                    notifications_service_api -> this "Reads from and writes to"
                }
            }

            auth_service = group "Authentication Service" {
                auth_service_api = container "Authentication API" {
                    tags "Authentication Service" "API"
                }
                container "Authentication Database" {
                    tags "Authentication Service" "Database"
                    auth_service_api -> this "Reads from and writes to"
                }
            }

            flight_service = group "Flights Service" {
                flight_service_api = container "Flights API" {
                    tags "Flights Service" "API"
                }
                container "Flights Database" {
                    tags "Flights Service" "Database"
                    flight_service_api -> this "Reads from and writes to"
                }
            }

            user -> webApplication "Uses"
            webApplication -> user
            webApplication -> api_gateway_api "Uses"
            api_gateway_api -> webApplication "Uses"
            api_gateway_api -> notifications_service_api "Reads from and writes to"
            notifications_service_api -> api_gateway_api "Reads from and writes to"
            api_gateway_api -> auth_service_api "Reads from"
            auth_service_api -> api_gateway_api "Reads from"
            flight_service_api -> api_gateway_api "Reads from and writes to"
        }
    }

    views {
        systemContext softwareSystem "SystemContext" {
            include *
            autoLayout
        }

        container softwareSystem "Containers_All" {
            include *
            autolayout
        }

        styles {
            element "Flight-ticket web app" {
                background #1168bd
                color #ffffff
            }
            element "Person" {
                shape person
                background #08427b
                color #ffffff
            }
        }
    }
    
}