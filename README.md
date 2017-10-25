# README

Provide Items API(XML)

```
   items GET    /items(.:format)               items#index
         POST   /items(.:format)               items#create
new_item GET    /items/new(.:format)           items#new
    item GET    /items/:id(.:format)           items#show
         PATCH  /items/:id(.:format)           items#update
```

- Only admin can be able to add items.
- Admin can change the status of each order(might ship the goods in different time), so when admin query by status, might display the same purchased.
