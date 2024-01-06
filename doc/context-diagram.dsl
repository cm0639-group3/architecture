workspace "Flight-Ticket buying system" {

    model {
        user = person "User" "Flight ticket shopper."

        softwareSystem = softwareSystem "Flight System"{
            webApplication = container "Flight-ticket web app" "React" {
                tags "Application"
            }

            email = container "Notification system for subscriptions." "Notifies users on purchases and tracked flights."
            
            flight_service = group "Flights Manager API" {
                flight_service_api = container "Flights Manager API" {
                    tags "Flights Manager API" "API"
                }
                container "Flights Database" {
                    tags "Flights Manager API" "Database"
                    flight_service_api -> this "Reads from and writes to"
                }
                notifications_service_api = container "Notifications API" {
                    tags "Notifications Service" "API"
                }
                container "Notifications Database" {
                    tags "Notifications Service" "Database"
                    notifications_service_api -> this "Reads from and writes to"
                }
                
                flight_service_api -> notifications_service_api "Queues notifications"
            }

            user -> webApplication "Uses"
            webApplication -> user "Reads from and writes to"
            webApplication -> flight_service_api "Uses"
            notifications_service_api -> email "Uses"
            email -> user "Sends notifications"
            flight_service_api -> webApplication "Reads from and writes to"
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