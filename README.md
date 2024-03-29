# laptop-haui
- Clone project về máy  
  `git clone https://github.com/cuongday/laptop-haui.git`
- Bắt đầu làm, kéo project mới về nhánh mình

  `git checkout dev`
    <br>
  `git pull origin dev`
  <br>
  `git checkout <your_branch_name>`
  <br>
  `git rebase dev`
- Checkout sang nhánh **_dev_**  
  `git checkout dev`
- Từ nhánh **_dev_** checkout sang nhánh của mình  
  `git checkout -b <your_branch_name>`
- Sau khi hoàn thành task push lên nhánh của mình **(Không push lên nhánh _main_ hoặc _dev_)**  
    `git add .`
    `git commit -m 'your message'`
    `git push origin <your_branch_name>`