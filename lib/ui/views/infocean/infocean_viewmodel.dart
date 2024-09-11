import 'package:plasticdive/app/app.dialogs.dart';
import 'package:plasticdive/app/app.locator.dart';
import 'package:plasticdive/services/diver_upgrade_service.dart';
import 'package:plasticdive/services/shared_preferences_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class InfoceanViewModel extends IndexTrackingViewModel {
  final _diverUpgradeService = locator<DiverUpgradeService>();
  final _sharedPreferencesService = locator<SharedPreferencesService>();
  final _dialogService = locator<DialogService>();

  bool isGarbageUnlocked(InfoceanInfo item) => item.requiredLevel == null && _sharedPreferencesService.unlockedGarbage.contains(item.name);

  bool isAnimalUnlocked(InfoceanInfo item) => item.requiredLevel != null && item.requiredLevel! <= _diverUpgradeService.diveDepthLevel;

  bool isCardUnlocked(InfoceanInfo item) => isGarbageUnlocked(item) || isAnimalUnlocked(item);

  int get diveDepthLevel => _diverUpgradeService.diveDepthLevel;

  List<InfoceanInfo> get source => currentIndex == 0 ? plasticGarbage : animals;

  final plasticGarbage = [
    InfoceanGarbage(
      name: 'Bottle',
      image: 'bottle.png',
      lifeLong: '450 years',
      description:
          'Plastic bottles are the most common type of plastic waste. They are made of polyethylene terephthalate (PET) and take 450 years to decompose.',
      points: 30,
      whereToFind:
          'Plastic bottles are commonly found along coastlines, floating in the ocean, washed up on beaches, and in marine debris hotspots where ocean currents converge, such as the Great Pacific Garbage Patch.',
      alternatives: 'Use reusable water bottles made from stainless steel, glass, or BPA-free plastic.',
      howToAvoid:
          'Avoid buying single-use bottled beverages whenever possible. Utilize water filtration systems at home or invest in portable filtration options for on-the-go use.',
      howToDispose:
          'Empty any remaining liquid. Rinse the bottle to remove any residue. Check local recycling guidelines to ensure proper recycling. If recyclable, place it in the appropriate recycling bin. If not, dispose of it in the regular trash.',
      quantity:
          'Millions of plastic bottles are thrown into the ocean each year. The exact number depends on various factors such as consumption habits, waste management practices, and geographic location.',
    ),
    InfoceanGarbage(
      name: 'Household Cleaner',
      image: 'household_cleaner_bottle.png',
      lifeLong: '450 years',
      description: 'Household cleaner bottles are made of high-density polyethylene (HDPE) and take 450 years to decompose.',
      points: 40,
      whereToFind:
          'Household cleaners can indirectly find their way into oceans through wastewater runoff, especially in urban and coastal areas where sewage systems may discharge directly into the ocean or nearby water bodies.',
      alternatives: 'Opt for environmentally friendly cleaning products available in refillable or concentrated forms.',
      howToAvoid:
          'Consider making homemade cleaning solutions using natural ingredients like vinegar, baking soda, and lemon or use eco-friendly cleaning products. Avoid single-use plastic bottles.',
      howToDispose:
          'Use up the product according to its intended purpose. Check the label for any specific disposal instructions. If the product is hazardous, follow local regulations for disposing of household hazardous waste. Empty containers can often be recycled if they are thoroughly rinsed and cleaned.',
      quantity:
          'While it\'s difficult to quantify the exact number of household cleaner containers that end up in the ocean annually, we know that it is a significant amount.',
    ),
    InfoceanGarbage(
      name: 'Microplastic',
      image: 'microplastic_cloud.png',
      lifeLong: 'Never',
      description:
          'Microplastics are small plastic particles that are less than 5mm in size. They are found in many personal care products and take forever to decompose.',
      points: 100,
      whereToFind:
          'Microplastics can be found throughout the ocean, from surface waters to the seafloor, as well as in coastal sediments and beaches. They are often transported by ocean currents and wind, accumulating in areas where currents converge, such as gyres and coastal regions.',
      howToAvoid:
          'Avoid using personal care products containing microbeads and synthetic microfibers. Choose clothing made from natural fibers like cotton, wool, or hemp to minimize shedding of microfibers during washing. Use washing machine filters designed to capture microfibers.',
      howToDispose:
          'Prevent the release of microplastics by avoiding products containing microbeads and synthetic microfibers. Properly dispose of clothing made from synthetic fibers by donating or recycling them when possible. Use washing machine filters designed to capture microfibers.',
      quantity:
          'Microplastics, which include microbeads from personal care products and microfibers from clothing, are estimated to enter the ocean in vast quantities each year, numbering them around 51 trillion particles in the ocean.',
    ),
    InfoceanGarbage(
      name: 'Plastic bag',
      image: 'plastic_bag.png',
      lifeLong: '10-20 years',
      description:
          'Plastic bags are frequently found in coastal environments, floating on the water\'s surface, tangled in coastal vegetation, and washed up on beaches. They are also a common type of marine debris in ocean gyres and accumulation zones.',
      points: 20,
      whereToFind: 'Plastic bags are found in oceans worldwide, often washed up on beaches or floating on the surface.',
      alternatives: 'Bring reusable bags or tote bags for shopping and opt for products with minimal or no packaging.',
      howToAvoid: 'Choose biodegradable or compostable bags when necessary.',
      howToDispose:
          'Reuse plastic bags whenever possible. Many grocery stores have plastic bag recycling bins; if available, return them there. If not recyclable, dispose of plastic bags in the regular trash, or consider repurposing them for other household tasks.',
      quantity:
          'Hundreds of billions of plastic bags are used globally each year, and a significant portion of them end up in the ocean through littering, improper disposal, and wind or water transport. 300 million plastic bags every year end up in the Atlantic Ocean alone.',
    ),
    InfoceanGarbage(
        name: 'Shampoo bottle',
        image: 'shampoo_bottle.png',
        lifeLong: '450 years',
        description: 'Shampoo bottles are made of high-density polyethylene (HDPE) and take 450 years to decompose.',
        points: 30,
        whereToFind:
            'Similar to plastic bottles, shampoo bottles can be found in coastal areas, floating at sea, washed ashore on beaches, and in marine debris accumulation zones.',
        alternatives: 'Switch to shampoo bars packaged in minimal or biodegradable packaging.',
        howToAvoid: 'Look for brands offering refill options for shampoo and other personal care products.',
        howToDispose:
            'Empty any remaining product. Rinse the bottle to remove residue. Check local recycling guidelines to see if the bottle is recyclable. If recyclable, place it in the appropriate recycling bin. If not, dispose of it in the regular trash.',
        quantity:
            'The number of shampoo bottles entering the ocean annually is difficult to determine precisely, but considering the widespread use of shampoo and other personal care products packaged in plastic, the figure could be substantial.'),
    InfoceanGarbage(
      name: 'Soda can',
      image: 'soda_can.png',
      lifeLong: '200-500 years',
      description: 'Soda cans are made of aluminum and take 200-500 years to decompose.',
      points: 40,
      whereToFind:
          'Soda cans are often found in coastal environments, on beaches, and floating in the ocean. They can also accumulate in areas where ocean currents converge, such as gyres and accumulation zones.',
      alternatives: 'Always choose beverages sold in cans made from aluminum, which is more easily recyclable than plastic.',
      howToAvoid: 'Opt for drinks packaged in glass bottles, which are also recyclable and have lower environmental impact.',
      howToDispose:
          'Empty any remaining liquid. Rinse the can to remove any residue. Aluminum cans are widely recyclable; check local recycling guidelines for proper disposal. If recyclable, place it in the appropriate recycling bin. If not, dispose of it in the regular trash.',
      quantity:
          'While aluminum cans are not plastic, they can still contribute to ocean pollution if not properly disposed of or recycled. However, the proportion of soda cans compared to plastic items in the ocean is likely lower.',
    ),
    InfoceanGarbage(
      name: 'Straw',
      image: 'straw.png',
      lifeLong: '200 years',
      description: 'Straws are made of polypropylene and take 200 years to decompose.',
      points: 10,
      whereToFind:
          'Straws are frequently found on beaches, floating in coastal waters, and washed up on shorelines. They are also a common type of marine debris found in coastal and oceanic gyres.',
      alternatives: 'Use reusable straws made from materials like stainless steel, bamboo, or glass.',
      howToAvoid: 'Skip using straws altogether whenever possible. If you need a straw, ask for a paper or biodegradable one.',
      howToDispose:
          'If using disposable plastic straws, dispose of them in the regular trash after use. Ensure they are properly discarded to prevent them from ending up in the environment.',
      quantity:
          'Billions of plastic straws are used and discarded globally each year, with a significant portion of them ending up in the ocean and contributing to marine pollution.',
    ),
    InfoceanGarbage(
      name: 'Cotton rod',
      image: 'cotton_rod.png',
      lifeLong: '200 years',
      description: 'Cotton rods are made of polypropylene and take 200 years to decompose.',
      points: 10,
      whereToFind:
          'Cotton rods can be found on beaches, washed up in coastal areas, and floating in coastal waters. They are also a type of marine debris found in coastal and oceanic gyres.',
      alternatives: 'Switch to cotton swabs with paper sticks or biodegradable materials.',
      howToAvoid: 'Consider using reusable ear cleaning tools like silicone or stainless steel ear picks.',
      howToDispose:
          'Dispose of cotton swabs in the regular trash. Do not flush cotton swabs down the toilet, as they can contribute to sewage blockages and environmental pollution.',
      quantity:
          'Cotton rods are used in large quantities for various purposes, including personal care and cleaning. While cotton swabs themselves are biodegradable, many have plastic sticks that can contribute to ocean pollution if improperly disposed of or flushed down toilets.',
    ),
    InfoceanGarbage(
      name: 'Toothbrush',
      image: 'tooth_brush.png',
      lifeLong: '450 years',
      description: 'Toothbrushes are made of polypropylene and take 450 years to decompose.',
      points: 30,
      whereToFind:
          'Toothbrushes can be found on beaches, washed up in coastal areas, and floating in coastal waters. They are also a type of marine debris found in coastal and oceanic gyres.',
      alternatives: 'Choose toothbrushes made from bamboo or other sustainable materials.',
      howToAvoid: 'Look for toothbrushes with replaceable heads to reduce overall waste.',
      howToDispose: 'Recycle the toothbrush if possible, otherwise dispose of it in the regular trash.',
      quantity:
          'Billions of plastic toothbrushes are used and discarded globally each year, with a significant portion of them ending up in the ocean.',
    ),
    InfoceanGarbage(
      name: 'Stirrer',
      image: 'stirrer.png',
      lifeLong: '200 years',
      description: 'Stirrers are made of polypropylene and take 200 years to decompose.',
      whereToFind:
          'Stirrers are often found on beaches, washed up in coastal areas, and floating in coastal waters. They are also a type of marine debris found in coastal and oceanic gyres.',
      points: 10,
      alternatives: 'Use reusable stirring utensils made from metal, bamboo, or other durable materials.',
      howToAvoid: 'Skip using stirrers or use a reusable spoon or fork instead.',
      howToDispose: 'If using disposable plastic stirrers, dispose of them in the regular trash after use.',
      quantity: 'Plastic stirrers, often used in coffee shops and bars, can contribute to ocean pollution if not disposed of properly.',
    ),
    InfoceanGarbage(
      name: 'Yogurt cup',
      image: 'yogurt_cup.png',
      lifeLong: '450 years',
      description: 'Yogurt cups are made of polystyrene and take 450 years to decompose.',
      points: 40,
      whereToFind:
          'Yogurt cups can be found on beaches, washed up in coastal areas, and floating in coastal waters. They are also a type of marine debris found in coastal and oceanic gyres.',
      alternatives: 'Opt for yogurt sold in larger containers to reduce packaging waste.',
      howToAvoid: 'Consider making homemade yogurt or purchasing yogurt in glass jars.',
      howToDispose:
          'Empty any remaining yogurt. Rinse the cup to remove any residue. Check local recycling guidelines to see if the cup is recyclable. If recyclable, place it in the appropriate recycling bin. If not, dispose of it in the regular trash.',
      quantity: '',
    ),
    InfoceanGarbage(
        name: 'Plastic cutlery',
        image: 'fork.png',
        lifeLong: '200-500 years',
        description: 'Plastic cutlery is made of polystyrene and takes 200-500 years to decompose.',
        points: 20,
        whereToFind:
            'Plastic cutlery is commonly found on beaches, washed up in coastal areas, and floating in coastal waters. They are also a type of marine debris found in coastal and oceanic gyres.',
        alternatives: 'Use reusable cutlery sets made from stainless steel, bamboo, or other materials.',
        howToAvoid: 'Carry your own utensils when dining out or ordering takeout.',
        howToDispose: 'If using disposable plastic cutlery, dispose of them in the regular trash after use.',
        quantity: 'Billions of plastic cutlery items are used and discarded globally each year, with a portion of them ending up in the ocean.'),
    InfoceanGarbage(
      name: 'Coffee cup',
      image: 'coffee_cup.png',
      lifeLong: '450 years',
      description: 'Coffee cups are made of polystyrene and take 450 years to decompose.',
      points: 30,
      whereToFind:
          'Coffee cups are frequently found on beaches, washed up in coastal areas, and floating in coastal waters. They are also a type of marine debris found in coastal and oceanic gyres.',
      alternatives: 'Bring a reusable coffee mug or thermos when getting coffee to-go.',
      howToAvoid: 'Look for coffee shops that offer discounts for customers who bring their own cups.',
      howToDispose:
          'Many disposable coffee cups are lined with plastic and cannot be recycled. Dispose of disposable coffee cups in the regular trash after use. Consider using a reusable coffee cup or thermos to reduce waste.',
      quantity: 'Billions of plastic coffee cups are used and discarded globally each year, with a portion of them ending up in the ocean.',
    ),
    InfoceanGarbage(
      name: 'Food packaging',
      image: 'food_packaging.png',
      lifeLong: '450 years',
      description: 'Food packaging is made of polystyrene and takes 450 years to decompose.',
      points: 30,
      whereToFind:
          'Food packaging is commonly found on beaches, washed up in coastal areas, and floating in coastal waters. They are also a type of marine debris found in coastal and oceanic gyres.',
      alternatives: 'Choose products with minimal or eco-friendly packaging, such as bulk bins or items wrapped in compostable materials.',
      howToAvoid: 'Consider making more meals from scratch to reduce reliance on pre-packaged foods.',
      howToDispose:
          'Empty any remaining food. Check local recycling guidelines to see if the packaging is recyclable. If recyclable, rinse the packaging and place it in the appropriate recycling bin. If not, dispose of it in the regular trash.',
      quantity:
          'The amount of plastic food packaging entering the ocean annually is substantial, as single-use plastic packaging is widely used in the food industry.',
    ),
    InfoceanGarbage(
      name: 'Lid',
      image: 'lid.png',
      lifeLong: '450 years',
      description: 'Lids are made of polystyrene and take 450 years to decompose.',
      points: 10,
      whereToFind:
          'Plastic lids are often found on beaches, washed up in coastal areas, and floating in coastal waters. They are also a type of marine debris found in coastal and oceanic gyres.',
      alternatives: 'Look for products with lids made from alternative materials like aluminum or compostable plastics.',
      howToAvoid: 'Choose products with minimal or no lids whenever possible. Choose products where lid is linked to the container.',
      howToDispose:
          'Empty any remaining contents. Check local recycling guidelines to see if the lid is recyclable. If recyclable, rinse the lid and place it in the appropriate recycling bin. If not, dispose of it in the regular trash.',
      quantity: '',
    ),
    InfoceanGarbage(
      name: 'Cigarette',
      image: 'cigarette.png',
      lifeLong: '10-12 years',
      description: 'Cigarettes are made of cellulose acetate and take 10-12 years to decompose.',
      points: 20,
      whereToFind:
          ' Cigarettes are one of the most common types of marine debris found on beaches, washed up in coastal areas, and floating in coastal waters. They are also a type of marine debris found in coastal and oceanic gyres.',
      alternatives: 'Quit smoking or switch to smokeless alternatives.',
      howToAvoid: 'Dispose of cigarette butts properly in designated receptacles and avoid littering.',
      howToDispose:
          'Properly extinguish the cigarette. Dispose of cigarette butts in designated receptacles or ashtrays. Do not litter cigarette butts; they are harmful to the environment and wildlife.',
      quantity:
          'Cigarette butts are one of the most common types of litter found in the ocean, with millions entering waterways annually and posing a threat to marine life.',
    ),
    InfoceanGarbage(
        name: 'Mask',
        image: 'mask.png',
        lifeLong: '450 years',
        description: 'Masks are made of polypropylene and take 450 years to decompose.',
        points: 30,
        whereToFind:
            'Disposable masks have become increasingly common as marine debris, found on beaches, washed up in coastal areas, and floating in coastal waters. They are also a type of marine debris found in coastal and oceanic gyres.',
        alternatives: 'Use reusable cloth masks and wash them regularly.',
        howToDispose:
            'If using a disposable mask, properly dispose of it in the regular trash after use. Cut the straps to prevent entanglement of wildlife before disposing of the mask.',
        quantity:
            'Due to the COVID-19 pandemic, millions of disposable masks have been improperly disposed of, leading to concerns about their impact on marine ecosystems. However, specific data on the number entering the ocean annually may not be available yet.'),
  ];

  final animals = [
    // Level 0 - Unlocked directly
    InfoceanAnimal(
      name: 'Clown fish',
      image: 'clown_fish.png',
      lifeLong: '5-10 years',
      description: 'Clown fish are small, brightly colored fish that live in anemones. They live 5-10 years.',
      requiredLevel: 0,
      minDepth: 10,
      maxDepth: 1000,
      whereToFind: 'Clownfish are found in the warm waters of the Indian and Pacific Oceans, primarily around coral reefs and in shallow lagoons.',
      endangeredStatus:
          'Clownfish are not currently listed as endangered, but they face threats from habitat destruction, pollution, and over-collection for the aquarium trade.',
    ),
    InfoceanAnimal(
      name: 'Coral',
      image: 'coral_1.png',
      lifeLong: '100-1000 years',
      description: 'Coral is a marine invertebrate that lives in colonies. It can live 100-1000 years.',
      requiredLevel: 0,
      minDepth: 10,
      maxDepth: 100,
      whereToFind:
          'Coral reefs are found in tropical and subtropical oceans around the world, particularly in the Indo-Pacific region, the Caribbean, and the Red Sea.',
      endangeredStatus:
          'Coral reefs are among the most threatened ecosystems on the planet due to factors such as climate change, ocean acidification, pollution, overfishing, and destructive fishing practices. Many coral species are endangered or critically endangered.',
    ),
    InfoceanAnimal(
      name: 'Exotic fish',
      image: 'exotic_fish.png',
      lifeLong: '5-10 years',
      description: 'Exotic fish are brightly colored fish that live in coral reefs. They live 5-10 years.',
      requiredLevel: 0,
      minDepth: 10,
      maxDepth: 1000,
      whereToFind: 'Exotic fish are typically found in coral reefs in tropical and subtropical waters.',
      endangeredStatus:
          'The status of exotic fish species varies greatly depending on the specific species and its habitat. Some exotic fish are endangered due to habitat destruction, overfishing, pollution, and invasive species.',
    ),
    InfoceanAnimal(
      name: 'Tuna fish',
      image: 'tuna_fish.png',
      lifeLong: '5-10 years',
      description: 'Tuna fish are large, fast-swimming fish that live in the open ocean. They live 5-10 years.',
      requiredLevel: 0,
      minDepth: 10,
      maxDepth: 2000,
      whereToFind:
          'Tuna fish are found in oceans around the world, ranging from tropical to temperate waters. They are highly migratory and can travel long distances.',
      endangeredStatus:
          'Several species of tuna, including bluefin tuna, are considered to be threatened or endangered due to overfishing, habitat degradation, and other factors.',
    ),

    // Level 1
    InfoceanAnimal(
      name: 'Jellyfish',
      image: 'jelly_fish.png',
      lifeLong: '1-5 years',
      description: 'Jellyfish are small, transparent invertebrates that live in the open ocean. They live 1-5 years.',
      requiredLevel: 1,
      minDepth: 10,
      maxDepth: 3000,
      whereToFind:
          'Jellyfish are found in oceans worldwide, from surface waters to the deep sea. They can also be found in coastal areas, estuaries, and even freshwater lakes.',
      endangeredStatus:
          'While jellyfish populations can fluctuate naturally and some species are considered invasive in certain areas, overall, jellyfish are not typically considered endangered.',
    ),
    InfoceanAnimal(
      name: 'Moon fish',
      image: 'moon_fish.png',
      lifeLong: '5-10 years',
      description: 'Moon fish are large, flat fish that live in the open ocean. They live 5-10 years.',
      requiredLevel: 1,
      minDepth: 10,
      maxDepth: 2000,
      whereToFind:
          'Moon fish are found in oceans worldwide, typically in deep, open waters. They are known for their unique physiology and ability to regulate body temperature.',
      endangeredStatus:
          'Moon fish are not currently listed as endangered, but like many marine species, they face threats from overfishing, bycatch, habitat degradation, and climate change.',
    ),

    // Level 2
    InfoceanAnimal(
      name: 'Globe fish',
      image: 'globe_fish.png',
      lifeLong: '5-10 years',
      description: 'Globe fish are small, round fish that live in the open ocean. They live 5-10 years.',
      requiredLevel: 2,
      minDepth: 10,
      maxDepth: 2000,
      whereToFind: 'Globe fish are found in tropical and subtropical waters around the world, often near coral reefs and rocky areas.',
      endangeredStatus: 'Some species of globe fish are threatened due to overfishing and habitat degradation.',
    ),

    InfoceanAnimal(
      name: 'Sea turtle',
      image: 'sea_turtle.png',
      lifeLong: '20-30 years',
      description: 'Sea turtles are large, slow-swimming reptiles that live in the open ocean. They live 20-30 years.',
      requiredLevel: 2,
      minDepth: 10,
      maxDepth: 2000,
      whereToFind:
          'Sea turtles are found in oceans worldwide, from tropical to temperate waters. They spend most of their lives at sea but come ashore to nest.',
      endangeredStatus:
          'Most species of sea turtles are listed as endangered or critically endangered due to threats such as habitat destruction, pollution, bycatch in fishing gear, and poaching.',
    ),

    InfoceanAnimal(
      name: 'Parrot fish',
      image: 'parrot_fish.png',
      lifeLong: '5-10 years',
      description: 'Parrot fish are small, brightly colored fish that live in coral reefs. They live 5-10 years.',
      requiredLevel: 2,
      minDepth: 10,
      maxDepth: 100,
      whereToFind: 'Parrotfish are found in tropical and subtropical waters around the world, primarily around coral reefs and rocky areas.',
      endangeredStatus: 'While some species of parrotfish are threatened by overfishing and habitat degradation, others are more abundant.',
    ),

    // Level 3
    InfoceanAnimal(
      name: 'Angel fish',
      image: 'angel_fish.png',
      lifeLong: '5-10 years',
      description: 'Angel fish are small, brightly colored fish that live in coral reefs. They live 5-10 years.',
      requiredLevel: 3,
      minDepth: 20,
      maxDepth: 100,
      whereToFind: 'Angelfish are found in tropical and subtropical waters around the world, primarily around coral reefs and rocky areas.',
      endangeredStatus: 'While some species of angelfish are threatened by habitat destruction and overfishing, others are more abundant.',
    ),
    InfoceanAnimal(
      name: 'Seahorse',
      image: 'sea_horse.png',
      lifeLong: '1-5 years',
      description: 'Seahorses are small, slow-swimming fish that live in coral reefs. They live 1-5 years.',
      requiredLevel: 3,
      minDepth: 50,
      maxDepth: 2000,
      whereToFind: 'Seahorses are found in shallow, coastal waters around the world, often in seagrass beds, coral reefs, and mangrove forests.',
      endangeredStatus: 'Many species of seahorses are threatened by habitat loss, overfishing, and the aquarium trade.',
    ),
    InfoceanAnimal(
      name: 'Dolphin',
      image: 'dolphin.png',
      lifeLong: '20-30 years',
      description: 'Dolphins are small, intelligent mammals that live in the open ocean. They live 20-30 years.',
      requiredLevel: 3,
      minDepth: 30,
      maxDepth: 300,
      whereToFind:
          'Dolphins are found in oceans worldwide, typically in coastal and offshore waters. They are highly intelligent and social animals.',
      endangeredStatus:
          'Some species of dolphins are threatened by factors such as bycatch in fishing gear, habitat degradation, pollution, and human disturbance.',
    ),
    InfoceanAnimal(
      name: 'Shark',
      image: 'shark.png',
      lifeLong: '20-30 years',
      description: 'Sharks are large, predatory fish that live in the open ocean. They live 20-30 years.',
      requiredLevel: 3,
      minDepth: 3000,
      maxDepth: 6000,
      whereToFind:
          'Sharks are found in oceans worldwide, from coastal areas to the open ocean. They occupy a variety of habitats, including coral reefs, deep sea trenches, and pelagic waters.',
      endangeredStatus:
          'Many species of sharks are threatened or endangered due to overfishing, bycatch in fishing gear, habitat destruction, and the shark fin trade.',
    ),

    // Level 4
    InfoceanAnimal(
      name: 'Hammerhead shark',
      image: 'hammerhead_shark.png',
      lifeLong: '20-30 years',
      description: 'Hammerhead sharks are large, predatory fish that live in the open ocean. They live 20-30 years.',
      requiredLevel: 4,
      minDepth: 3000,
      maxDepth: 6000,
      whereToFind: 'Hammerhead sharks are found in tropical and temperate waters worldwide, often in coastal areas and around seamounts.',
      endangeredStatus:
          'Some species of hammerhead sharks are listed as endangered or critically endangered due to overfishing and habitat degradation.',
    ),
    InfoceanAnimal(
      name: 'Giant squid',
      image: 'giant_squid.png',
      lifeLong: '1-5 years',
      description: 'Giant squids are large, deep-sea invertebrates that live in the open ocean. They live 1-5 years.',
      requiredLevel: 4,
      minDepth: 3000,
      maxDepth: 6000,
      whereToFind: 'Giant squids are found in deep ocean waters worldwide, typically in the mesopelagic and bathypelagic zones.',
      endangeredStatus:
          'Giant squids are not currently listed as endangered, but they are relatively poorly understood due to their deep-sea habitat.',
    ),
    InfoceanAnimal(
      name: 'Lion fish',
      image: 'lion_fish.png',
      lifeLong: '5-10 years',
      description: 'Lion fish are small, brightly colored fish that live in coral reefs. They live 5-10 years.',
      requiredLevel: 3,
      minDepth: 3000,
      maxDepth: 6000,
      whereToFind: 'Lionfish are native to the Indo-Pacific region but have become invasive in parts of the Atlantic Ocean and Caribbean Sea.',
      endangeredStatus: 'Lionfish are not considered endangered; in fact, they are considered invasive species in many areas.',
    ),
    InfoceanAnimal(
      name: 'Whale shark',
      image: 'whale_shark.png',
      lifeLong: '20-30 years',
      description: 'Whale sharks are large, slow-swimming fish that live in the open ocean. They live 20-30 years.',
      requiredLevel: 4,
      minDepth: 10,
      maxDepth: 2000,
      whereToFind: 'Whale sharks are found in tropical and temperate waters worldwide, often in coastal areas and around coral reefs.',
      endangeredStatus:
          'Whale sharks are listed as vulnerable to extinction due to threats such as bycatch in fishing gear, habitat degradation, and the shark fin trade.',
    ),

    // Level 5
    InfoceanAnimal(
      name: 'Whale',
      image: 'whale.png',
      lifeLong: '40-90 years',
      description: 'Whales are large, marine mammals that live in the open ocean. They live 40-90 years.',
      requiredLevel: 5,
      minDepth: 5000,
      maxDepth: 7500,
      whereToFind:
          'Whales are found in oceans worldwide, from polar regions to tropical waters. They are highly migratory and occupy a variety of habitats, from coastal areas to the open ocean.',
      endangeredStatus:
          'Many species of whales are listed as endangered or vulnerable due to threats such as overfishing, habitat destruction, pollution, ship strikes, and climate change.',
    ),
    InfoceanAnimal(
      name: 'Angler fish',
      image: 'anglerfish.png',
      lifeLong: '5-10 years',
      description: 'Angler fish are small, deep-sea fish that live in the open ocean. They live 5-10 years.',
      requiredLevel: 5,
      minDepth: 5000,
      maxDepth: 7500,
      whereToFind: 'Anglerfish are found in deep ocean waters worldwide, typically in the abyssal and bathypelagic zones.',
      endangeredStatus: 'Anglerfish are not typically considered endangered, but they face threats from habitat degradation and overfishing.',
    ),
  ];

  Future showInfoceanDetails(int index) async {
    final infocean = source[index];
    await _dialogService.showCustomDialog(
      variant: DialogType.infoceanDetails,
      title: infocean.name,
      description: infocean.description,
      data: infocean,
      barrierDismissible: true,
      hasImage: true,
      imageUrl: infocean.imagePath,
    );
  }
}

abstract class InfoceanInfo {
  final String name;
  final String image;

  final int? requiredLevel;
  final int? points;

  int? get collectionTime => points == null ? null : points! ~/ 10;

  final int? minDepth;
  final int? maxDepth;

  String get imagePath => 'assets/images/$imageFolder/$image';
  final String lifeLong;
  final String? whereToFind;
  final String? quantity;
  final String? endangeredStatus;
  final String description;
  final String? alternatives;
  final String? howToAvoid;
  final String? howToDispose;

  String get imageFolder;

  bool get shouldFlip;

  InfoceanInfo({
    required this.name,
    required this.image,
    required this.lifeLong,
    required this.description,
    this.quantity,
    this.endangeredStatus,
    this.whereToFind,
    this.alternatives,
    this.howToAvoid,
    this.howToDispose,
    this.points,
    this.requiredLevel,
    this.minDepth,
    this.maxDepth,
  });
}

class InfoceanAnimal extends InfoceanInfo {
  @override
  String get imageFolder => 'animals';

  @override
  bool get shouldFlip => true;

  InfoceanAnimal({
    required super.name,
    required super.image,
    required super.lifeLong,
    required super.description,
    super.whereToFind,
    super.endangeredStatus,
    required super.requiredLevel,
    super.minDepth,
    super.maxDepth,
  });
}

class InfoceanGarbage extends InfoceanInfo {
  @override
  String get imageFolder => 'garbages';

  @override
  bool get shouldFlip => false;

  InfoceanGarbage({
    required super.name,
    required super.image,
    required super.lifeLong,
    required super.description,
    super.whereToFind,
    super.alternatives,
    super.howToAvoid,
    super.howToDispose,
    required super.points,
    super.quantity,
  });
}
