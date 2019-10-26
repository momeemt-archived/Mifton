# Views (Slim/SCSS) 設計について
renderする要素は `/views/render_files` に統一  
その中でも比較的小さい要素は `/views/render_files/components` に、大きい要素は `/views/render_files/layouts` に統一する。  

## CSS

コントローラー名_要素名-状態名
