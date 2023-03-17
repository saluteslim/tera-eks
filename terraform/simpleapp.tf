# resource "kubernetes_deployment" "simple-app" {
#     metadata {
#       name = "simple-app"
#         namespace = "default"
#         labels = {
#           app = "simple-app"
#         }

#     }
#     spec {
#       replicas = 1
#       selector {
#         match_labels = {
#           app = "simple-app"
#         }
#       }
#       template {
#         metadata {
#           labels = {
#             app = "simple-app"
#           }
#         }
#         spec {
#           container {
#             name = "simple-app"
#             image = "saluteslim/tesreact:latest"
#             port {
#               container_port = 80
#             }
#           }
#         }
#       }
#     }
  
# }

# resource "kubernetes_service" "simple-app-lb" {
#     metadata {
#       name = "simple-app-lb"
#       namespace = "default"
#       labels = {
#         app = "simple-app-lb"
#       }
#     }
#     spec {
#       selector = {
#         app = "simple-app"
#       }
#       port {
#         port = 80
#         target_port = 80
#       }
#       type = "LoadBalancer"
#     }
#     depends_on = [
#       kubernetes_deployment.simple-app
#     ]
  
# }