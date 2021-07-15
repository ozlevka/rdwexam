
provider "aws" {
    region = "eu-central-1"
}

resource "aws_key_pair" "project_key_pair" {
    key_name = "${var.general.project_name}-key"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDMe8a4xNI1oWcVpzR9BXe3wq6LanEJ7rwt7p6OjBd+2sGgupzo3kZxdkh01E4uWLri/UaZYDdCapO1AHTt1zd79VHzMIgsaaFZu0aI1VJcvYotvMoZfMPPuKHM3jIiCAThcLqVlUq93uEHw5VwQWzyf20b+w8xZJYd1rvMq8MQqLdLKc9F8cktTECWdVLWhVAtPzX1+3d8z68YIbech/XOUiWMAb+7kr1ld/V8cLjY8OWldceZoAiLH9PvMVRQluHLxph+jAQyyC4rgEhbDd2c1e0+sunScnRQDkjXQycisdcWtlRBvmCA16JPDtSvRAyyym/SoUdGcDxU2IJ7m5xpHEnzuuJDnwlym+VQQ+pg+8orbYPTFBdBtNHSuJ7QWb9btcVToiKcnuDr2IM4rIC9TUL/nb2c1aOpNHsxw2ObED0QdrXkdaHwdOrfnvsWm9yJC17pfOHAd7oW9AwnvJ284vHry490Tjyo0N0cTTTGCJHksCPT+PvAaSNRMerxIH8="
}





