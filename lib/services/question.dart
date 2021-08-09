var question = [
  [
    'Grand Central Terminal, Park Avenue, New York is the world\'s ',
    'largest railway station'
  ],
  [
    'For which of the following disciplines is Nobel Prize awarded',
    'All of the above'
  ],
  ['jackie chan was born in', 'china'],
  ['america capital is', 'dc'],
  ['germany capital is', 'barlin'],
  ['Hitler party which came into power in 1933 is known as', 'Nazi Party'],
  ['First Afghan War took place in', '1839'],
  ['First China War was fought between', 'China and Britain'],
  ['Friction can be reduced by changing from', 'sliding to rolling'],
  ['During World War II, when did Germany attack France?', '1940']
];
var answer = [
  [
    'largest railway station',
    'highest railway station',
    'longest railway station',
    'None of the above'
  ],
  [
    'Physics and Chemistry',
    'Physiology or Medicine',
    'Literature, Peace and Economic',
    'All of the above'
  ],
  ['india', 'usa', 'china', 'japan'],
  ['califonia', 'dallas', 'dc', 'crotia'],
  ['alaska', 'barlin', 'dallas', 'sydney'],
  ['Labour Party', 'Nazi Party', 'Ku-Klux-Klan', 'Democratic Party'],
  ['1839', '1843', '1833', '1848'],
  [
    'China and Britain',
    'China and France',
    'China and Egypt',
    'China and Greek'
  ],
  [
    'rolling to sliding',
    'potential energy to kinetic energy',
    'dynamic to static',
    'sliding to rolling',
  ],
  ['1943', '1941', '1942', '1940']
];

class Answer {
  String yourPerformance(int result) {
    String performance = '';
    if (result <= 20) {
      performance = 'bad performance';
    } else if (result > 20 && result < 35) {
      performance = 'Not bad';
    } else if (result >= 35) {
      performance = 'Good performance';
    }
    return performance.toString();
  }
}
