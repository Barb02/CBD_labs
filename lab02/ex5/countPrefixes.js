countPrefixes = function () {

    var prefixes = [21, 22, 231, 232, 233, 234 ];
    
    for (var i = 0; i < prefixes.length; i++) {
        var count = db.phones.countDocuments({"components.prefix" : prefixes[i]});
        print("Number of phone numbers with the prefix " + prefixes[i] + " : " + count);
    }
  
    print("Done!");
}
  