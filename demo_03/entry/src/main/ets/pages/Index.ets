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
        AppBar({ title: $r('app.string.counter_title') })
        Column() {
          Text($r('app.string.counter_tip'))
            .fontSize($r('app.float.counter_desc_size'))
            .margin({ top: 15, bottom: 15 })
          Text(this.count.toString())
            .fontSize($r('app.float.counter_value_size'))
            .fontWeight(FontWeight.Bold)
          Text('鸿蒙纪元 HarmonyUnit: 18px').fontSize('18px')
          Text('鸿蒙纪元 HarmonyUnit: 18vp').fontSize('18vp')
          Text('鸿蒙纪元 HarmonyUnit: 18').fontSize(18)
          Text('鸿蒙纪元 HarmonyUnit: 18fp').fontSize('18fp')
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
  private title: string | Resource = '';

  @Builder
  leadingBuilder() {
    Button() {
      Image($r('app.media.logo_app'))
    }
    .width(120)
    .height(60)
    .backgroundColor(Color.Transparent)
  }

  @Builder
  tailingBuilder() {
    Button() {
      Image($r('app.media.more'))
    }
    .width(36)
    .height(36)
    .backgroundColor(Color.Transparent)
  }

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
    .backgroundColor($r('app.color.theme_color'))
    .width('100%')
    .height(56)
    .padding({ left: 20, right: 20 })
    .justifyContent(FlexAlign.SpaceBetween)
  }
}