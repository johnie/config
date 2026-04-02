function awsl {
  aws sso login --profile "${1:?profile}"
}

function eksctx {
  local profile="${1:?profile}"
  local cluster="${2:?cluster}"

  aws eks update-kubeconfig --profile "$profile" --name "$cluster"
}
