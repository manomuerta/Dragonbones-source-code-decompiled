package _13555
{
   import _1038._1037;
   import _1045.Group;
   import _1045._1046;
   import _1185._1188;
   import _1185._1189;
   import _127._171;
   import _1529._1528;
   import _1529._1530;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filesystem.File;
   import flash.filesystem.FileMode;
   import flash.filesystem.FileStream;
   
   public class _13559 extends _171
   {
      private const WIDTH:int = 750;
      
      private const HEIGHT:int = 600;
      
      private var _13969:_13560;
      
      private var _2513:Array;
      
      private var _13966:int = 0;
      
      private var _13972:XML;
      
      public function _13559()
      {
         this._2513 = [];
         super();
         this.width = this.minWidth = this.WIDTH;
         this.height = this.minHeight = this.HEIGHT;
         title = tr("Welcome.newFeature");
      }
      
      override protected function _2438() : void
      {
         var language:String;
         var path:String;
         var _2490:_1046;
         var dp:_1037;
         var layout:_1189;
         var imgList:XMLList;
         var itemWidth:int;
         var itemHeight:int;
         var itemLen:int;
         var i:int;
         var group:Group;
         var hlayout:_1189;
         var j:int;
         var alltext:Boolean = false;
         var url:String = null;
         var htmlText:String = null;
         var p:RegExp = null;
         var newText:String = null;
         var btn:_13562 = null;
         super._2438();
         closeButton.visible = true;
         language = _1528.language;
         language = language == _1530.ru_RF ? _1530.en_US : language;
         path = "assets/newfeature/" + language + "/newfeature.xml";
         this._13973(path);
         _2490 = new _1046();
         dp = new _1037();
         _2490.dataProvider = dp;
         layout = new _1189();
         layout._6056 = true;
         layout.padding = 0;
         layout.gap = 0;
         _2490.layout = layout;
         _2490.clipAndEnableScrolling = true;
         _2490._6053 = function(param1:Object):Class
         {
            if(param1.alltext)
            {
               return _13557;
            }
            return _13554;
         };
         imgList = this._13972.img;
         itemWidth = int(this._13972.size.@width);
         itemHeight = int(this._13972.size.@height);
         itemLen = int(imgList.length());
         i = 0;
         while(i < itemLen)
         {
            alltext = Boolean(int(imgList[i].@alltext[0]));
            url = alltext ? "" : imgList[i].@url[0];
            htmlText = imgList[i].span[0].toXMLString();
            p = /\n\s\s/g;
            newText = htmlText.replace(p,"");
            dp.addItem({
               "alltext":alltext,
               "url":url,
               "width":itemWidth,
               "height":itemHeight,
               "htmlText":newText
            });
            i++;
         }
         this._13969 = new _13560();
         this._13969._13971 = itemWidth;
         this._13969._8185 = 300;
         this._13969.skinName = _13561;
         this._13969.verticalCenter = this._13969.horizontalCenter = 0;
         this._13969.viewport = _2490;
         this._13969.width = itemWidth;
         this._13969.height = itemHeight;
         this._13969.addEventListener("pageChanged",this._13968);
         addElement(this._13969);
         group = new Group();
         group.percentWidth = 100;
         hlayout = new _1189();
         hlayout._2401 = _1188.CENTER;
         group.bottom = 0;
         group.layout = hlayout;
         addElement(group);
         j = 0;
         while(j < itemLen)
         {
            btn = new _13562();
            btn.skinName = _13563;
            btn.addEventListener(MouseEvent.CLICK,this._7234);
            btn.selected = j == 0 ? true : false;
            group.addElement(btn);
            this._2513.push(btn);
            j++;
         }
      }
      
      private function _7234(param1:MouseEvent) : void
      {
         var _loc2_:_13562 = param1.target as _13562;
         var _loc3_:int = int(this._2513.indexOf(_loc2_));
         this._13967 = _loc3_;
      }
      
      private function _13970() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this._2513.length)
         {
            if(_loc1_ == this._13967)
            {
               (this._2513[_loc1_] as _13562).selected = true;
            }
            else
            {
               (this._2513[_loc1_] as _13562).selected = false;
            }
            _loc1_++;
         }
      }
      
      public function get _13967() : int
      {
         return this._13966;
      }
      
      public function set _13967(param1:int) : void
      {
         if(this._13967 == param1)
         {
            return;
         }
         this._13966 = param1;
         this._13970();
         this._13969._8187 = this._13967;
      }
      
      private function _13968(param1:Event) : void
      {
         this._13967 = this._13969._8187;
      }
      
      public function _13973(param1:String) : void
      {
         var _loc3_:FileStream = null;
         var _loc2_:File = File.applicationDirectory.resolvePath(param1);
         if(_loc2_.exists)
         {
            _loc3_ = new FileStream();
            _loc3_.open(_loc2_,FileMode.READ);
            this._13972 = new XML(_loc3_.readUTFBytes(_loc3_.bytesAvailable));
            _loc3_.close();
            return;
         }
         throw new Error("xml load fail");
      }
   }
}

