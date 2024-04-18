import 'package:flutter/material.dart';
import 'package:note_dart/note.dart';

build(BuildContext context, Pen print) {
  print.markdown(r'''
# flutter 可读性问题

flutter的helloworld 一个简单的程序，也可能让人阅读产生不适

```dart
Scaffold(
    appBar: AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text(widget.title),
    ),
    body: Center(
      widthFactor:1,
      heightFactor:1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('You have pushed the overview this many times:'),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: _incrementCounter,
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    ),
  );
```

元素也不多，如果用jsx 形式表示，大概是这样
```html
<Scaffold>
  <AppBar backgroundColor={Theme.of(context).colorScheme.inversePrimary}>
    <Title title={widget.title}></Title>
  </AppBar>
  <Body>
    <Center widthFactor=1 heightFactor=1>
      <Column mainAxisAlignmen={ MainAxisAlignment.center}>
        <Text>You have pushed the overview this many times:</Text>
        <Text style={Theme.of(context).textTheme.headlineMedium}>{$_counter}</Text>
      </Column>
    </Center>
  </Body>
  <FloatingActionButton onPressed={_incrementCounter} tooltip: 'Increment'>
    <Icon icon={Icons.add}/>
  </FloatingActionButton>
</Scaffold>
```

即便jsx这种技术你不太懂，也没关系，我也不太懂，当成html即可。

你各用5秒钟快速阅读以上flutter和jsx/html两种写法，有什么体会？

我的体会是: jsx/html让我更快抓住主干，更易高速阅读，我猜想原因如下：

1. html的代码严格分离了 '属性' 和 '子元素'，html习惯于把所有属性都列在一行, 而子元素换行，
  这样我们的眼睛可以从上到下只扫描元素名，而忽略属性，快速的掌握组件的主干结构。而flutter的属性
  和子组件的结构是混在一起的，大脑没办法战略性的忽略细枝末节，只有每行全阅读完才能构造出组件骨干的印象。
2. <Column></Column>组件的上下闭合是成对出现的，定位复杂的大结构中的上下关系，比Column(....)括号形式快多了
  ，超过5层以上的嵌套括号，大脑不容易清醒。
3. 你检查下你的.editorconfig是不是`max_line_length = 80`，我们一般习惯遵循80个字宽的代码界指导，
   而html根本不鸟这个，html的代码都老宽了，这就造成了html形式的代码层级明显较少，代码更便于表现主干关系。

好了，综上，我们模仿一下jsx/html的思维，看看是不是舒适很多（如果谁能开发个类似的格式化器，那就再好不过了）：

```dart
Scaffold(
   appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary,
       title: Text(widget.title)
   ),
   body: Center( widthFactor:1,heightFactor:1,
     child: Column( mainAxisAlignment: MainAxisAlignment.center,
       children: <Widget>[
         const Text('You have pushed the overview this many times:'),
         Text('click cound', style: Theme.of(context).textTheme.headlineMedium),
       ],
     ),
   ),
   floatingActionButton: FloatingActionButton(onPressed: (){}), tooltip: 'Increment',
       child: const Icon(Icons.add),
   ),
 );
```

总结：

一说到flutter的嵌套地狱，难以阅读，很多人就说是你代码没写好，怎么不去组件化控制嵌套层级呢，还有人说设计一些链式调用啊，但这都不是本质，
我们发现，flutter和jsx/html的多层嵌套可读性，其根源，是属性与子元素是否分离的设计，大脑理解代码骨干的速度，全靠怎么忽略细枝末节，
这是代码可读性的本质性设计问题，扫了一眼类似的swiftui,也差不多。

除了上面讨论的视觉外，flutter倾向于一切皆组件，优点也早吹过了，我们这里不讲，单讲两个恶果：因为一切皆组件，那嵌套的级数自然是升高的，
这也是代码复杂性的设计性问题；另外，组件太多了，组件爆炸了，这么多组件看着目录都累。

当然如果，你实在和html没共鸣，这也是仁者见仁的事情嘛。


## swiftui 尾部闭包

https://www.reddit.com/r/dartlang/comments/mzfyob/will_dart_ever_gain_support_for_trailing_lambdas/

```swfit
Column(
    modifier = Modifier.padding(16.dp),
    content = {
        Text("Some text")
        Text("Some more text")
        Text("Last text")
    }
)

// can be written as

Column(modifier = Modifier.padding(16.dp)) {
    Text("Some text")
    Text("Some more text")
    Text("Last text")
}

## kotlin 也可以


```





  ''');
}
