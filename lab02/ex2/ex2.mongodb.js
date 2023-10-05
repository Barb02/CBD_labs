use('cbd');

// 1
db.restaurants.find()

// 2
db.restaurants.find(
{}, { restaurant_id: 1, nome: 1, localidade: 1, gastronomia: 1}
);

// 3
db.restaurants.find(
{}, { _id: 0, restaurant_id: 1, nome: 1, localidade: 1, address: {zipcode: 1} }
);

// 4
db.restaurants.countDocuments({ localidade: "Bronx" })

// 5
db.restaurants.find({},{_id: 0, nome: 1}).limit(15).sort({nome: 1})

// 6
db.restaurants.find({
    grades: {
        $elemMatch: {score: { $gte: 85 }}
      }
})

// 7
db.restaurants.find({
    grades: {
        $elemMatch: {
          score: { $gte: 80, $lte: 100 }
        }
      }
})

// 8
db.restaurants.find({
    "address.coord.0": { $lt: -95.7 }
})

// 9
db.restaurants.find({
    gastronomia: { $ne: "American" }, "address.coord.0": { $lt: -65 }, "grades.score" : {$gt: 70}
})

// 10
db.restaurants.find({nome: {$regex: "^Wil"}}, {restaurant_id: 1, nome: 1, localidade: 1, gastronomia: 1})

// 11
db.restaurants.find(
    {localidade: "Bronx", $or: [{gastronomia: "American"}, {gastronomia: "Chinese"}] },
    {_id: 0, nome: 1, localidade: 1, gastronomia: 1}
)

// 12
db.restaurants.find(
    {$or: [{localidade: "Staten Island"}, {localidade: "Queens"}, {localidade: "Brooklyn"}] },
    {_id: 0, restaurant_id: 1, nome: 1, localidade: 1, gastronomia: 1}
)

// 13
db.restaurants.find(
    {grades: 
        {$not: {
            $elemMatch: {
                "score": { $gt: 3 }
            }
        }}
    },
    {
        _id: 0, nome: 1, localidade: 1, gastronomia: 1, "grades.score": 1
    }
)

// 14
db.restaurants.find(
    {grades: 
        {$elemMatch: {
            grade: "A", score: 10, date: ISODate("2014-08-11T00:00:00Z") 
        }}
    },
    {
        _id: 0, nome: 1, grades: 1
    }
)

// 15
db.restaurants.find(
    {
        "grades.1.grade": "A", 
        "grades.1.date": ISODate("2014-08-11T00:00:00Z")
    },
    {
        _id: 0, restaurant_id: 1, nome: 1, "grades.score": 1
    }
)

// 16
db.restaurants.find(
    {
        "address.coord.1": {$gt: 42, $lte: 52}
    },
    {
        _id: 0, restaurant_id: 1, nome: 1, address: 1
    }
)

// 17
db.restaurants.find({}, {_id: 0, nome: 1, localidade: 1, gastronomia: 1}).sort({gastronomia:1, localidade: -1})

// 18
db.restaurants.find(
    {
        localidade: "Brooklyn", "grades.1.grade": "A", gastronomia: { $ne: "American" }
    },
    {
        _id: 0, nome: 1, localidade: 1, "grades.grade": 1, gastronomia: 1
    }
).sort({gastronomia: -1})

// 19
db.restaurants.aggregate([
    {
      $project: { numeroDeItens: { $size: "$grades" }}
    },
    {
      $group: {
        _id: null,
        numGrades: { $sum: "$numeroDeItens" }}
    },
    {
        $project: { _id: 0}
    }
])

// 20
db.restaurants.aggregate([
    {
      $unwind: "$grades" // separar cada elemento do array em um objeto (unwind é mais eficiente q o metodo anterior nesse caso)
    },
    {
      $group: {
        _id: "$restaurant_id",
        nome: { $first: "$nome" }, // busca o nome do primeiro (vários objetos com o mesmo nome foram criados pelo unwind)
        numGrades: { $sum: 1 } // soma 1 a cada elemento que é agrupado
      }
    },
    {
      $sort: { numGrades: -1 } 
    },
    {
      $limit: 3
    },
    {
      $project: {
        _id: 0, nome: 1, numGrades: 1 
      }
    }
])
  
// 21
db.restaurants.aggregate([
    {
      $unwind: "$grades" 
    },
    {
      $group: {
        _id: { $dayOfWeek: "$grades.date" }, // 1 = domingo 
        numGrades: { $sum: 1 } 
      }
    },
    {
      $project: {
        _id: 0,
        diaDaSemana: "$_id",
        numGrades: 1
      }
    }
]).sort({diaDaSemana: 1})
  
// 22
db.restaurants.aggregate([
    {
      $group: {
        _id: "$localidade",
        totalRestaurantes: { $sum: 1 } 
      }
    },
    {
      $project: {
        _id: 0,
        localidade: "$_id",
        totalRestaurantes: 1
      }
    }
])

// 23
  db.restaurants.aggregate([
    {
      $match: {
        gastronomia: "Portuguese",
        "address.coord.0": { $lt: -60 }
      }
    },
    {
      $unwind: "$grades"
    },
    {
      $group: {
        _id: "$_id",
        totalScore: { $sum: "$grades.score" },
        gastronomia: { $first: "$gastronomia" },
        nome : { $first: "$nome" }
      }
    },
    {
      $match: {
        totalScore: { $gt: 50 },
      }
    },
    {
      $project: {
        totalScore: 1,
        gastronomia: 1,
        nome: 1
      }
    }
  ])
  

// 24
db.restaurants.aggregate([
    {
        $match: { "address.rua": "Fifth Avenue" }
    },
    {
        $group: {
            _id: "$gastronomia"
        }
    },
    {
        $count: "totalGastronomias"
    }
])


// 25
db.restaurants.aggregate([
    {
        $unwind: "$grades" 
    },
    {
        $match: {
          "grades.date": { $gte: ISODate("2014-01-01T00:00:00Z") }
        }
    },
    {
      $group: {
        _id: "$_id",
        avgScore: { $avg: "$grades.score" },
        numGrades: { $sum: 1 },
        nome : { $first: "$nome" }
      }
    },
    {
      $match: {
        avgScore: { $gt: 30 },
      }
    },
    {
      $project: {
        avgScore: 1,
        numGrades: 1,
        nome: 1
      }
    }
  ])

// 26
db.restaurants.aggregate([
    {
        $match: { 
            localidade: "Brooklyn"
        }
    },
    {
        $group: {
          _id: "$gastronomia",
          num: {$sum: 1}
        }
    }
])


// 27
db.restaurants.find(
    {
        "address.coord.0": {$gt: -73.9, $lt: -73},
        "address.coord.1": {$gt: 40.5, $lt: 41},
        $or: [{ nome: {$regex: "food"} }, { nome: {$regex: "Food"}}]
    },
    {_id: 0, nome:1, address: 1}
).sort({"address.building": 1})


// 28
db.restaurants.aggregate([
    {
        $match: { gastronomia: "Pizza/Italian", localidade: "Bronx"}
    },
    {
        $unwind: "$grades" 
    },
    {
      $group: {
        _id: "$_id",
        avgScore: { $avg: "$grades.score" },
        nome : { $first: "$nome" },
        gastronomia : { $first: "$gastronomia"}
      }
    },
    {
      $sort: {
        avgScore: -1
      }
    },
    {
      $limit: 1
    },
    {
      $project: {
        _id: 0,
        avgScore: 1,
        nome: 1
      }
    }
])


// 29

db.restaurants.find(
    { localidade: "Manhattan" }, 
    { nome: 1, "grades.date": 1, _id: 0 } 
).sort({ "grades.date": -1 }).limit(1)  
  

// 30
db.restaurants.aggregate([
    {
        $unwind: "$grades" 
    },
    {
      $group: {
        _id: "$_id",
        avgScore: { $avg: "$grades.score" },
        nome : { $first: "$nome" },
        gastronomia : { $first: "$gastronomia"},
        localidade: { $first: "$localidade"}
      }
    },
    {
      $sort: {
        avgScore: -1
      }
    },
    {
      $limit: 5
    },
    {
      $project: {
        _id: 0,
        avgScore: 1,
        nome: 1,
        gastronomia: 1,
        localidade: 1
      }
    }
])