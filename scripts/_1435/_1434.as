package _1435
{
   import egret.utils._1288;
   import flash.display.Bitmap;
   import flash.display.NativeWindow;
   import flash.display.NativeWindowInitOptions;
   import flash.display.NativeWindowSystemChrome;
   import flash.display.NativeWindowType;
   import flash.display.StageAlign;
   import flash.display.StageScaleMode;
   import flash.system.Capabilities;
   
   public class _1434 extends NativeWindow
   {
      private var bg:Bitmap;
      
      public function _1434(param1:Class, param2:Class)
      {
         var _loc3_:NativeWindowInitOptions = new NativeWindowInitOptions();
         _loc3_.systemChrome = NativeWindowSystemChrome.NONE;
         _loc3_.transparent = true;
         _loc3_.type = NativeWindowType.LIGHTWEIGHT;
         if(_1288.renderMode)
         {
            _loc3_.renderMode = _1288.renderMode;
         }
         _loc3_.resizable = false;
         _loc3_.minimizable = false;
         _loc3_.maximizable = false;
         super(_loc3_);
         this.stage.align = StageAlign.TOP_LEFT;
         this.stage.scaleMode = StageScaleMode.NO_SCALE;
         if(stage.contentsScaleFactor == 1)
         {
            this.bg = new param1() as Bitmap;
         }
         else
         {
            this.bg = new param2() as Bitmap;
            this.bg.scaleX = 0.5;
            this.bg.scaleY = 0.5;
         }
         this.stage.addChild(this.bg);
         this.width = this.bg.width;
         this.height = this.bg.height;
      }
      
      override public function activate() : void
      {
         this.x = Capabilities.screenResolutionX / 2 - this.width / 2;
         this.y = Capabilities.screenResolutionY / 2 - this.height / 2;
         super.activate();
      }
   }
}

