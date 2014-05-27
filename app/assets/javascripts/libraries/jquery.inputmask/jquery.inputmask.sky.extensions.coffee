jQuery ($) ->
  $.extend $.inputmask.defaults.definitions,
    '.':
      validator: '[\u0000-\uFFFF]'
      cardinality: 1

  $.extend $.inputmask.defaults.aliases,
    'barcode' :
      mask: '9{10,15}'
      placeholder: ''
    'title' :
      mask: '.{3,100}'
      placeholder: ''
    'vnd' :
      alias: 'numeric'
      suffix: ' VNĐ'
      autoGroup: true
      groupSeparator: ','
      integerDigits: 13
      digits: 0