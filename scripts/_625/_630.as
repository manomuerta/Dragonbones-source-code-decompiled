package _625
{
   import _1009.NewSymbolWindow;
   import _1045.Button;
   import _1045.Label;
   import _1045._1081;
   import _11106._11105;
   import _11111._11110;
   import _1177.UIEvent;
   import _127._162;
   import _1374.ColorPicker;
   import _1374.TextInput;
   import _470._469;
   import _51._50;
   import _51._52;
   import _51._71;
   import _648._665;
   import _721._763;
   import _73.SymbolType;
   import _783.CommandNotification;
   import _93._94;
   import _97._118;
   import _97._124;
   import egret.utils.FileUtil;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.filesystem.File;
   
   public class _630 extends _94
   {
      private var window:NewSymbolWindow;
      
      private var _13376:Boolean = true;
      
      private var libraryPath:String;
      
      public function _630()
      {
         super();
      }
      
      public function _3155(param1:String) : void
      {
         this.libraryPath = param1;
         this.window = new NewSymbolWindow();
         this.window.addEventListener(UIEvent.CREATION_COMPLETE,this._5481);
         this.window.open();
      }
      
      protected function _5481(param1:UIEvent) : void
      {
         this._5571.addEventListener(Event.CHANGE,this._13375);
         this._5571.addEventListener(FocusEvent.FOCUS_OUT,this._5562);
         this._5567.addEventListener(Event.CHANGE,this._5561);
         this._5566.addEventListener(FocusEvent.FOCUS_OUT,this._5560);
         this._5556.addEventListener(MouseEvent.CLICK,this._5541);
         this._5554.addEventListener(MouseEvent.CLICK,this._5539);
         this._5566.text = this.libraryPath;
         this.window._5569 = !this._3845();
         this._5567._5568 = 0;
         this._5561();
         this._13376 = !this._3248(this._5571.text);
         this._5554.enabled = this._13376;
      }
      
      protected function _13375(param1:Event) : void
      {
         this._13376 = !this._3248(this._5571.text);
         this._4171();
      }
      
      protected function _5562(param1:FocusEvent) : void
      {
         this._5571.text = this._5571.text.replace(/\s/g,"");
         this._13376 = !this._3248(this._5571.text);
         this._4171();
      }
      
      protected function _5561(param1:Event = null) : void
      {
         this.window._5563 = this._5567._5568 == 2;
      }
      
      protected function _5560(param1:FocusEvent) : void
      {
         this._4171();
      }
      
      protected function _5541(param1:MouseEvent) : void
      {
         FileUtil.browseForOpen(this._5531,3);
      }
      
      protected function _5531(param1:File) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc2_:String = FileUtil.escapeUrl(param1.nativePath);
         this._5566.text = _loc2_;
         this._4171();
      }
      
      protected function _5539(param1:MouseEvent) : void
      {
         var _loc2_:SymbolType = null;
         if(this._5567._5568 == 0)
         {
            _loc2_ = SymbolType.ARMATURE;
         }
         else if(this._5567._5568 == 1)
         {
            _loc2_ = SymbolType.MC;
         }
         else if(this._5567._5568 == 2)
         {
            _loc2_ = SymbolType.STAGE;
         }
         else
         {
            _loc2_ = SymbolType.SHEET;
         }
         _11110.instance._11320._11139(_11105.NewSymbol_SymbolType,_loc2_.toString());
         var _loc3_:_50 = _50._1782(this._5571.text,_loc2_);
         if(_loc2_ == SymbolType.STAGE)
         {
            _2214._1844._2871._3286._3285(_loc3_,_763._1572(int(this._4025.txt.text),int(this._4024.txt.text),this._4066._4061));
         }
         var _loc4_:_52 = _52._1729("root",null);
         _loc3_._1794(_loc4_);
         _loc3_._1968();
         var _loc5_:Object = _469._3490(this.dragonBonesVO,_loc3_,this._2871._2865,this.libraryPath);
         _1567(new CommandNotification(CommandNotification.ADD_ARMATURE,_loc5_));
         _11110.instance._11320._11132();
         this.window.close();
      }
      
      private function _3248(param1:String) : Boolean
      {
         if(param1 == null || param1 == "")
         {
            return true;
         }
         return this.dragonBonesVO._2129(param1);
      }
      
      protected function _4171() : void
      {
         var _loc1_:Boolean = _118._2381(this._5566.text);
         if(!_loc1_)
         {
            this._2633.text = tr("NewSymbolWindow.libraryPath.invalid");
         }
         else if(!this._13376)
         {
            if(this._5571.text == "")
            {
               this._2633.text = tr("NewSymbolWindow.nameNull");
            }
            else
            {
               this._2633.text = tr("NewSymbolWindow.nameConflict");
            }
         }
         else
         {
            this._2633.text = "";
         }
         this._5554.enabled = _loc1_ && this._13376;
      }
      
      private function _5564() : void
      {
         var _loc1_:String = null;
         switch(this._5567._5568)
         {
            case 0:
               _loc1_ = "Armature";
               break;
            case 1:
               _loc1_ = "MovieClip";
               break;
            case 2:
               _loc1_ = "Stage";
               break;
            case 3:
               _loc1_ = "Sprite";
         }
         this._5571.text = _124._1747(_loc1_,this.dragonBonesVO._2129);
      }
      
      protected function _3845() : Boolean
      {
         var _loc2_:_50 = null;
         var _loc1_:Vector.<_50> = this.dragonBonesVO._2126;
         for each(_loc2_ in _loc1_)
         {
            if(_loc2_._1811 == SymbolType.STAGE)
            {
               return true;
            }
         }
         return false;
      }
      
      protected function get _5571() : TextInput
      {
         return this.window._5571;
      }
      
      protected function get _5554() : Button
      {
         return this.window._5554;
      }
      
      protected function get _5567() : _1081
      {
         return this.window._5567;
      }
      
      protected function get _5556() : Button
      {
         return this.window._5565;
      }
      
      protected function get _5566() : TextInput
      {
         return this.window._5566;
      }
      
      protected function get _2633() : Label
      {
         return this.window._2633;
      }
      
      protected function get _4025() : _162
      {
         return this.window._4025;
      }
      
      protected function get _4024() : _162
      {
         return this.window._4024;
      }
      
      protected function get _4066() : ColorPicker
      {
         return this.window._4066;
      }
      
      protected function get _2871() : _665
      {
         return this._2214._1844._2871;
      }
      
      protected function get dragonBonesVO() : _71
      {
         return this._2871.dragonBonesVO;
      }
   }
}

