@Entry
@Component
struct Index {
  @State count: number = 0;

  // 计数器
  increment(): void {
    this.count++;
  }
  build() {
    Stack() {
      Column() {
        AppBar({ title: '计数器' })
        Column() {
          Text('下面是你要点击的数字')
            .fontSize(18)
            .margin({ top: 15, bottom: 15 })
          Text(this.count.toString())
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
        }
        .justifyContent(FlexAlign.Center)
        // .backgroundColor(Color.Orange)
        .width('100%')
        .height('100%')
      }
      .alignItems(HorizontalAlign.Start)
      // .backgroundColor(Color.Pink)
      .width('100%')
      .height('100%')
      Button({ type: ButtonType.Circle, stateEffect: true }) {
        SymbolGlyph($r('sys.symbol.plus'))
          .fontSize(24)
          .fontColor([Color.White])
          .fontWeight(FontWeight.Bold)
      }
      .onClick(() => this.increment())
      .width(56)
      .height(56)
      .margin({ right: 20, bottom: 30 })
      .backgroundColor('#31bd4')
    }
    .alignContent(Alignment.BottomEnd)
  }
}


@Component
struct AppBar {
  private title: string = '';

  @Builder
  leadingBuilder() {}

  @Builder
  tailingBuilder() {}

  @BuilderParam leading: () => void = this.leadingBuilder;
  @BuilderParam tailing: () => void = this.tailingBuilder;

  build() {
    Row() {
      this.leading()
      Text(this.title)
        .fontSize(20).fontWeight(FontWeight.Bold)
        .fontColor($r('sys.color.white'))
      this.tailing()
    }
    .backgroundColor('#317bd4')
    .width('100%')
    .height(56)
    .padding({ left: 20, right: 20 })
    .justifyContent(FlexAlign.SpaceBetween)
  }
}