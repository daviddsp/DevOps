# resource "digitalocean_project" "playground" {
#   name        = "test"
#   description = "A project to represent development resources."
#   purpose     = "Web Application"
#   environment = "Development"
#   resources   = [ digitalocean_kubernetes_cluster.k8s.urn ]
# }
# Deploy the actual Kubernetes cluster
resource "digitalocean_kubernetes_cluster" "k8s" {
  name    = "terraform-do-cluster"
  region  = "ams3"
  version = "1.21.3-do.0"

  tags = ["my-tag"]

  # This default node pool is mandatory
  node_pool {
    name       = "default-pool"
    size       = "s-1vcpu-2gb" # minimum size, list available options with `doctl compute size list`
    auto_scale = false
    node_count = 3
    tags       = ["node-pool-tag"]
    labels = {
      "cluster" = "up"
    }
  }
}

# resource "digitalocean_container_registry" "registry" {
#   name                   = "playground-container"
#   subscription_tier_slug = "starter"
# }
