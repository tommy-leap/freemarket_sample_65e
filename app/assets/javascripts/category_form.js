$(function(){
  function appendOption(category){ // optionの作成
    var html = `<option value="${category.id}">${category.name}</option>`;
    return html;
  }
  function appendChidrenBox(insertHTML){ // 子セレクトボックスのhtml作成
    // debugger
    var childSelectHtml = ''
        childSelectHtml =  `<select id="product_child_id" class="category_select_id">
                              <option value="">---</option>
                              ${insertHTML}
                            </select>`
    $('.actions').append(childSelectHtml);
  }
  function appendgrandChidrenBox(insertHTML){ // 孫セレクトボックスのhtml作成
    var grandchildrenSelectHtml = '';
    grandchildrenSelectHtml = `<select id="product_grandchild_id" class="category_select_id">
                                <option value="">---</option>
                                ${insertHTML}
                               </select>`
    $('.actions').append(grandchildrenSelectHtml);
  }

  $(document).on('change', '#product_category_id', function(){  // 親セレクトボックスの選択肢を変えたらイベント発火
    var productcategory = document.getElementById('product_category_id').value; 
  // ↑ productcategoryに選択した親のvalueを代入
    if (productcategory != ''){
 // ↑ productcategoryが空ではない場合のみAjax通信を行う｡選択肢を初期選択肢'---'に変えると､通信失敗となってしまうため｡
      $.ajax({
        url: 'category_children',
        type: 'GET',
        data: { productcategory: productcategory },
        dataType: 'json'
      })
      .done(function(children){ // 送られてきたデータをchildrenに代入
        var insertHTML = '';
        children.forEach(function(child){  
          // forEachでchildに一つずつデータを代入｡子のoptionが一つずつ作成される｡
          insertHTML += appendOption(child); 
        });
        appendChidrenBox(insertHTML); 
        $(document).on('change', '#product_category_id', function(){
  // 通信成功時に親の選択肢を変えたらイベント発火｡子と孫を削除｡selectのidにかけるのではなく､親要素にかけないと残ってしまう
          $('#product_child_id').remove(); 
          $('#product_grandchild_id').remove();
        })
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
 
      })
    }
  });
 
 
  // document､もしくは親を指定しないと発火しない
  $(document).on('change', '#product_child_id', function(){
    var productcategory = document.getElementById('product_child_id').value;
    if (productcategory != ''){
    $.ajax ({
      url: 'category_grandchildren',
      type: 'GET',
      data: { productcategory: productcategory },
      dataType: 'json'
    })
    .done(function(grandchildren){
      var insertHTML = '';
      grandchildren.forEach(function(grandchild){
        insertHTML += appendOption(grandchild);
        });
        appendgrandChidrenBox(insertHTML);  
        $(document).on('change', '#product_child_id',function(){
          $('#product_grandchild_id').remove();
          })
        })  
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
    }
  });
});