### User Stories & Functional Representations

```
As a user,
So I could use a bike,
I would like to learn how to take a bike out of the dock
```

|  Objects | Messages |
| --- | --- |
| User | display_instructions

```
As a user,
So I could use a bike,
I would like to see how many bikes are available
```

|  Objects | Messages |
| --- | --- |
| User or Docking_Station | show_bikes

```
As a user,
So I could pay,
I would like to see how much I need to pay, and how long I will get the bike formatter
```

|  Objects | Messages |
| --- | --- |
| User | show_payment_instructions

```
As a user,
So I can hire a bike,
When I pay, release a bike to be used
```

|  Objects | Messages |
| --- | --- |
| Docking_Station | release_bike

```
As a user,
So I can pay,
I would like a system to allow me to make a transaction
```

|  Objects | Messages |
| --- | --- |
| Docking_Station | request_payment

```
As a user,
So I can see if there is a late penalty fee,
Open up return slot, after paying late penalty fee
```

|  Objects | Messages |
| --- | --- |
| Docking_Station | bike_returned_on_time?
| Docking_Station | pay_penalty
| System | add_transaction?

```
As a user,
So I can return my bike
Open up a return slot, and report bike is securely stored
```

|  Objects | Messages |
| --- | --- |
| Docking_Station | return_bike
| Docking_Station | update_bike_count

```
As a user,
I want to select from a easy to use interface
System to have an easy to read interface
```

|  Objects | Messages |
| --- | --- |
| Docking_Station | display_instructions

```
As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like vans to take broken bikes from docking stations and deliver them to garages to be fixed.
```

|  Objects | Messages |
| --- | --- |
| Docking_Station | broken_bike
| van | pickup_broken_bike
| garage | receive_broken_bike

```
As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like vans to collect working bikes from garages and distribute them to docking stations.
```

|  Objects | Messages |
| --- | --- |
| Docking_Station | working_bike
| van | pickup_working_bike
| Docking_Station | receive_working_bike
