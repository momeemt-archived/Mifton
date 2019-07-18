# Mifton SCSS Rule Docs
MiftonはBEMを採用していましたが、冗長なCSSが多く生成されるために独自のルールを設定します。

## Controller
コントローラーの頭文字２文字を接頭辞にクラス名を設定します。

```scss
.be {
  // BectorController の View
}

.ho {
  // HomeController の View
}


.mn {
  // manages, manage_xxx の View
}
```

## Parts
パーツは "\_" (アンダーバー) で付け加えます。  
コントローラーやパーツはキャメルケースで記述します。

```scss
.be {
  &_sideBar {
    // BectorController View の サイドバー
  }
}

```

## State
状態の情報を "-" (ハイフン) で付け加えます。  
パーツ、状態情報は入れ子にして重ねることができます。

```scss
.be {
  &_sideBar {
    &_linkList {
      &-currentLink {
        // 現在いるページのリンク状態
      }
    }
  }
}

```

## 特別なCSS
共通の部品な度は基本的に "app" をPartsとしたクラス命名を行います。

```slim
.be
  .be_topWrap
    .be_topWrap_header.app_wd100
      img src="../../~"

```
