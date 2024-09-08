package _1011
{
   import _1045.Button;
   import _1045.Group;
   import _1045.Label;
   import _127._171;
   import _1374.TextInput;
   import _1404._1407;
   import _477.ExportEgretController;
   import _51._50;
   import _721._720;
   import _73.SymbolType;
   import _97._125;
   import egret.utils.FileUtil;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filesystem.File;
   
   public class _1010 extends _171
   {
      public static const _14765:int = 85;
      
      private var _7061:_720;
      
      private var _7058:TextInput;
      
      public var _5554:Button;
      
      public var _5555:Button;
      
      public function _1010(param1:_720)
      {
         super();
         this.minWidth = 580;
         this.minHeight = 200;
         this.title = tr("ExportEgretProjectWindow.Title");
         this.width = NaN;
         this._7061 = param1;
      }
      
      override protected function _2438() : void
      {
         var _loc1_:Group = null;
         var _loc2_:Label = null;
         super._2438();
         _loc1_ = _125._2414();
         _loc1_.percentWidth = 100;
         _2512.percentWidth = 100;
         _2512.addElement(_loc1_);
         _loc2_ = new Label();
         _loc2_.width = _14765;
         _loc2_.text = tr("Export.outputPath");
         this._7058 = new TextInput();
         this._7058.percentWidth = 100;
         this._7058.text = this._7061.ouputPath;
         var _loc3_:Button = _125._2405();
         _loc1_.addElement(_loc2_);
         _loc1_.addElement(this._7058);
         _loc1_.addElement(_loc3_);
         var _loc4_:Group;
         (_loc4_ = _125._2403()).percentWidth = 100;
         _2512.addElement(_loc4_);
         this._5554 = _125._2399();
         this._5555 = _125._2406();
         _2632.addElement(this._5554);
         _2632.addElement(this._5555);
         addElement(_2632);
         _2632.bottom = 20;
         _2632.right = 20;
         this._5555.addEventListener(MouseEvent.CLICK,_2517);
         this._5554.addEventListener(MouseEvent.CLICK,this._7060);
         _loc3_.addEventListener(MouseEvent.CLICK,this._7057);
         this._7058.addEventListener(Event.CHANGE,this._7056);
         this.refresh();
      }
      
      private function _7056(param1:Event) : void
      {
         this.refresh();
      }
      
      private function _7060(param1:MouseEvent) : void
      {
         this._7061.ouputPath = this._7058.text;
         var _loc2_:Object = new Object();
         _loc2_._3238 = this._7061;
         this._3228._3679(_loc2_);
      }
      
      private function _7057(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         FileUtil.browseForOpen(function(param1:File):void
         {
            if(!param1)
            {
               return;
            }
            var _loc2_:String = FileUtil.escapeUrl(param1.nativePath);
            _7058.text = _loc2_;
            refresh();
         },3);
      }
      
      public function refresh() : void
      {
         var _loc4_:File = null;
         var _loc1_:Boolean = false;
         var _loc2_:Vector.<_50> = this._7061.dragonBonesVO._2126;
         var _loc3_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < _loc2_.length)
         {
            if(_loc2_[_loc3_]._1811 == SymbolType.STAGE)
            {
               _loc1_ = true;
            }
            _loc3_++;
         }
         if(_loc1_)
         {
         }
         this._5554.enabled = false;
         if(this._7058.text != "")
         {
            try
            {
               _loc4_ = new File(this._7058.text);
               if(_loc4_)
               {
                  this._5554.enabled = true;
               }
            }
            catch(error:Error)
            {
            }
         }
      }
      
      private function get _3228() : ExportEgretController
      {
         return _1407.getInstance(ExportEgretController) as ExportEgretController;
      }
   }
}

