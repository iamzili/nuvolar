### Get Kubeconfig file

aws eks --region $(terraform output -raw region) update-kubeconfig \
    --name $(terraform output -raw cluster_name)


### Test api-gateway

```
# wait one min for NLB
curl -vL $(terraform output -raw elb_dns_name)
```