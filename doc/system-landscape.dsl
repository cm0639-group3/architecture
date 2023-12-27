workspace {

    model {
        user = person "User" "Flight ticket shopper."
        softwareSystem = softwareSystem "Flight-ticket system" "Flight ticket broker."

        user -> softwareSystem "Uses"
    }

    views {
        systemContext softwareSystem "SystemContext" {
            include *
            autoLayout
        }

        styles {
            element "Flight-ticket system" {
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