import ToDoItem from '../view/ToDoItem';
import CommonConstants from '../common/constant/CommonConstants'
import DataModel from '../viewModel/DataModal'


@Entry
@Component
struct Index {
  // private totalTasks: Array<string> = [];
  @State totalTasks: Array<string> = [];

  // 图标函数
  @Builder labelIcon(icon: Resource) {
    Image(icon)
      .objectFit(ImageFit.Contain)
      .width($r('app.float.checkbox_width'))
      .height($r('app.float.checkbox_width'))
      .margin({
        top: $r('app.float.title_margin_top'),
        left: $r('app.float.checkbox_margin'),
        bottom: $r('app.float.title_margin_bottom')
      })
      .onClick(() => {
        // AlertDialog.show(
        //   {
        //     title: 'title',
        //     message: '' + this.totalTasks,
        //     autoCancel: true,
        //     alignment: DialogAlignment.Bottom,
        //     offset: { dx: 0, dy: -20 },
        //     gridCount: 3,
        //     confirm: {
        //       value: 'button',
        //       action: () => {
        //         console.info('Button-clicking callback')
        //       }
        //     },
        //     cancel: () => {
        //       console.info('Closed callbacks')
        //     }
        //   }
        // )
        this.totalTasks.push('222');
      })
  }

  // 获取数据
  aboutToAppear(): void {
    this.totalTasks = DataModel.getData();
  }

  build() {
    Column({ space: CommonConstants.COLUMN_SPACE }) {
      Row({ space: 5 }) {
        Text($r('app.string.page_title'))
          .fontSize($r('app.float.title_font_size'))
          .fontWeight(FontWeight.Bold)
          .lineHeight($r('app.float.title_font_height'))
          // .width(CommonConstants.TITLE_WIDTH)
          .margin({
            top: $r('app.float.title_margin_top'),
            bottom: $r('app.float.title_margin_bottom')
          })
          .textAlign(TextAlign.Start)
        this.labelIcon($r('app.media.icon_add'))
      }
        .alignItems(VerticalAlign.Center)
        .width(CommonConstants.TITLE_WIDTH)
        // .height($r('app.float.title_font_height'))
      ForEach(this.totalTasks, (item: string) => {
        ToDoItem({ content: item })
      }, (item: string) => JSON.stringify(item))
    }
    .width(CommonConstants.FULL_LENGTH)
    .height(CommonConstants.FULL_LENGTH)
    .backgroundColor($r('app.color.page_background'))
  }
}