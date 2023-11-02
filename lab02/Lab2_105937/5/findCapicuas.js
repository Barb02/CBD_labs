findCapicuas = function () {
    
    var cursor = db.phones.aggregate([
        {
            $project: 
            {
                display: 1,
                firstHalf: {$substr: ["$display", 5, 4]},
                secondHalf: {$substr: ["$display", 10, -1]}
            }
        }
    ]);

    cursor.forEach(function(doc) {
        if(doc.firstHalf == doc.secondHalf.split('').reverse().join('')){
            print("Capicua found:");
            printjson(doc.display);
        }

    });

    print("Done!");
}