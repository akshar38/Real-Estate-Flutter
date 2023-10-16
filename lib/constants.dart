import 'package:flutter/material.dart';

const kPrimaryColor = Color.fromARGB(235, 105, 27, 154);
const kPrimaryLightColor = Color.fromARGB(255, 248, 231, 255);
const kPrimaryBackGroundColor = Color.fromARGB(199, 230, 152, 252);
const double defaultPadding = 16.0;
Map<String?, String?> items = {
  'Sofa':
      'https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-three-seater-sofa-30.png?alt=media&token=c54422fb-c4c9-4ec0-a353-33d1234d34d9',
  'Fire Extinguisher':
      'https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-fire-extinguisher-30.png?alt=media&token=0329ca5f-e733-4489-8929-973f41566c0f',
  'Fire Sensors':
      'https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-smoke-detector-30.png?alt=media&token=e41c7da9-efe6-433a-ba9f-7514fc4a124a',
  'Sprinklers':
      'https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-fire-sprinkler-30.png?alt=media&token=d4c449c6-4489-4557-9b21-745426486a7d',
  'Gatted':
      'https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-front-gate-open-30.png?alt=media&token=456a9365-4c2b-48ec-8aa1-1650e1d30b49',
  'Emergency exit':
      'https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-emergency-exit-30.png?alt=media&token=da3aeeb6-25bf-4d1a-bce1-2740879f9914',
  '24x7 Security':
      'https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-security-guard-30.png?alt=media&token=8cedf3ca-47e1-405b-9e55-94d80b519210',
  'Camera':
      'https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-bullet-camera-30.png?alt=media&token=4a7357c5-1e86-463c-b6c2-ef2f52d254ca',
  'Garden':
      'https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-garden-30.png?alt=media&token=d69f350a-29ce-46d5-890e-4701ed8b5787',
  'ClubHouse':
      'https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-soccer-ball-30.png?alt=media&token=4f095411-6269-4d72-bdc5-b20955c09efb',
  'Gym':
      'https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-dumbbell-30.png?alt=media&token=98a981c1-2da6-4e38-a30a-0b15eac0bedc',
  'Swimming pool':
      'https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-summer-30.png?alt=media&token=79477314-0657-4576-8f7c-73ab9fb9da48',
  'Dinig Table':
      'https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-dining-table-30.png?alt=media&token=83fa534d-797c-4e47-aede-ba0f97b25ebf',
  'Refrigerator':
      'https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-fridge-30.png?alt=media&token=972bfefe-6889-4b98-b4d8-a9aa213c9c69',
  'A.C':
      'https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-air-conditioner-30.png?alt=media&token=6717d358-0142-483c-ab3b-848f54d03e33',
  'Chimney':
      'https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-cooker-hood-30.png?alt=media&token=d3664a3b-8b9c-4154-a107-41d47c9bed82',
  'Study Table':
      'https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-study-table-30.png?alt=media&token=7752d24c-a73d-4141-94ab-058097c3a3cf',
  'Bed':
      'https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-bedroom-interior-64%20(1).png?alt=media&token=9d652a44-f606-4c62-8e61-fc2a765b5641',
  'Television':
      'https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-tv-30.png?alt=media&token=8dc7b412-bccc-478c-b27c-17cc95062850',
  'Wardrobes':
      'https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-wardrobe-30.png?alt=media&token=b5988360-47a1-4645-80ae-725a7cb285f4',
  'Geysers':
      'https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-water-boiler-30.png?alt=media&token=e433d372-a53a-460b-90a4-16a81ca4a70d',
  'Fan':
      'https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-ceiling-fan-off-30.png?alt=media&token=63a31b2e-762f-41c2-a50d-f6e909f7288b',
  'Curtain':
      'https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-curtain-30.png?alt=media&token=d5b524a7-f46d-4fc6-9c4f-e376b12e8587',
  'Power Backup':
      'https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-lightning-bolt-30.png?alt=media&token=fa79991b-9f98-4b71-b472-0742485de387',
  'Boys':
      'https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-boys-60.png?alt=media&token=5c757107-6c82-4dfb-9d2a-7b1e94752b26',
  'Girls':
      'https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-girl-60.png?alt=media&token=dd3644c9-6582-4b7b-a17e-7e93eff7d829',
  'Normal':
      'https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-bunk-bed-64.png?alt=media&token=62be238f-17d3-4cdd-857d-577c93ee72d8',
  'Deluxe':
      'https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-bedroom-interior-64%20(1).png?alt=media&token=9d652a44-f606-4c62-8e61-fc2a765b5641',
  'Super Deluxe':
      'https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-bedroom-64%20(1).png?alt=media&token=5193950d-7242-475e-a61b-6ed156f017fb',
  'RO Filter':
      'https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-filter-30.png?alt=media&token=574dfa94-6df2-4fb9-8562-d3e572dcaa8a',
  'Mini Kitchen':
      'https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-kitchen-room-30.png?alt=media&token=01b21312-1db5-433e-b4be-f93e1b0a10e2',
  'Dining Hall':
      'https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-dining-30.png?alt=media&token=ee9e3724-30f4-4d35-8cc4-8d99fcbcb828',
  'Conference Room':
      'https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-conference-30.png?alt=media&token=6fd3ddf2-c3cd-45a9-8d85-a72f5e90972d',
  'Table':
      'https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-study-table-30.png?alt=media&token=7752d24c-a73d-4141-94ab-058097c3a3cf',
  'Fans':
      'https://firebasestorage.googleapis.com/v0/b/realestate-b36f4.appspot.com/o/appimages%2Ficons8-ceiling-fan-off-30.png?alt=media&token=63a31b2e-762f-41c2-a50d-f6e909f7288b',
};
