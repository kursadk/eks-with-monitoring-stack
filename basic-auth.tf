resource "htpasswd_password" "hash" {
  password = var.NGINX_BASIC_AUTH_PASSWORD
}



resource "kubernetes_secret" "nginx-basic-auth" {
  metadata {
    name      = "nginx-basic-auth"
  }

  data = {
    auth = "${var.NGINX_BASIC_AUTH_USER}:${htpasswd_password.hash.apr1}"
  }


}

