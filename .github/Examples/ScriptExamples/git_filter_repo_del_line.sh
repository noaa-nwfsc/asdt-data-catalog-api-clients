git filter-repo --blob-callback '
  if b"PolicyId" in blob.data:
      lines = blob.data.split(b"\n")
      blob.data = b"\n".join([l for l in lines if b"PolicyId" not in l])
'
