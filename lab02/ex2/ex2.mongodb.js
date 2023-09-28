use('cbd');

db.restaurants.find()

db.restaurants.find(
{}, { restaurant_id: 1, name: 1, localidade: 1, gastronomia: 1}
);

db.restaurants.find(
    {}, { _id: 0, restaurant_id: 1, name: 1, localidade: 1, address: {zipcode: 1} }
    );