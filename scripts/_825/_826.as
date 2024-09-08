package _825
{
   import _1404._1407;
   import _51._70;
   import _521._528;
   import _724._725;
   import _859._860;
   import egret.core._1140;
   import flash.display.BitmapData;
   import flash.display.BitmapDataChannel;
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   
   public class _826 extends _1140 implements _860
   {
      private static var _6221:GlowFilter = new GlowFilter(4278255360,1,2,2,5,1);
      
      private static var _6226:Dictionary = new Dictionary();
      
      private static var _3689:Matrix = new Matrix();
      
      private static var _6225:Sprite = new Sprite();
      
      private var _bitmapData:BitmapData;
      
      private var _color:uint;
      
      private var _6216:Number = 1;
      
      private var _6217:Number = 1;
      
      private var _6214:Boolean = false;
      
      private var glowFilter:GlowFilter;
      
      private var _6223:_70;
      
      private var _5741:Boolean;
      
      private var _5740:Boolean;
      
      public function _826()
      {
         super();
         mouseEnabled = false;
         visible = false;
      }
      
      public function set _2104(param1:_725) : void
      {
      }
      
      public function get _5747() : Boolean
      {
         return this._5741;
      }
      
      public function get _5744() : Boolean
      {
         return this._5740;
      }
      
      public function set _5747(param1:Boolean) : void
      {
         this._5741 = param1;
      }
      
      public function set _5744(param1:Boolean) : void
      {
         this._5740 = param1;
      }
      
      override protected function _2476() : void
      {
         if(this._6214)
         {
            this._6214 = false;
            this.draw();
         }
      }
      
      private function draw() : void
      {
      }
      
      private function _6222() : BitmapData
      {
         var w:Number;
         var h:Number;
         var r:Rectangle;
         var p:Point;
         var helpBitmapDataGreen:BitmapData = null;
         var helpBitmapDataFinal:BitmapData = null;
         var bitmapData:BitmapData = this._bitmapData.clone();
         bitmapData.colorTransform(new Rectangle(0,0,this._bitmapData.width,this._bitmapData.height),new ColorTransform(0,0,0,1,0,0,0,0));
         w = this._bitmapData.width * this._6216;
         h = this._bitmapData.height * this._6217;
         try
         {
            helpBitmapDataGreen = new BitmapData(w,h,true,4278190080);
            helpBitmapDataFinal = helpBitmapDataGreen.clone();
         }
         catch(error:Error)
         {
            return null;
         }
         r = new Rectangle(0,0,w,h);
         p = new Point(0,0);
         _3689.a = this._6216;
         _3689.d = this._6217;
         _3689.tx = 0;
         _3689.ty = 0;
         _6225.graphics.clear();
         _6225.graphics.beginBitmapFill(bitmapData,_3689,false,true);
         _6225.graphics.drawRect(0,0,w,h);
         _6225.filters = [_6221];
         helpBitmapDataGreen.draw(_6225,null,null,null,null,true);
         helpBitmapDataGreen.threshold(helpBitmapDataGreen,r,p,"==",0,0,16777215,true);
         _6225.filters = [this.glowFilter];
         helpBitmapDataFinal.draw(_6225,null,null,null,null,true);
         helpBitmapDataFinal.threshold(helpBitmapDataFinal,r,p,"==",4278190080,0,4294967295,true);
         helpBitmapDataFinal.threshold(helpBitmapDataFinal,r,p,">",4278190080,this._color,16777215,true);
         helpBitmapDataFinal.copyChannel(helpBitmapDataGreen,r,p,BitmapDataChannel.GREEN,BitmapDataChannel.ALPHA);
         return helpBitmapDataFinal;
      }
      
      protected function _6212() : void
      {
         this._6214 = true;
         _2466();
      }
      
      public function set _5724(param1:Object) : void
      {
         if(this._bitmapData == param1)
         {
            return;
         }
         this._bitmapData = param1 as BitmapData;
         if(this._bitmapData)
         {
            this._6212();
            visible = true;
         }
         else
         {
            visible = false;
         }
      }
      
      public function set color(param1:uint) : void
      {
         if(this._color == param1)
         {
            return;
         }
         this._color = param1;
         this.glowFilter = new GlowFilter(this._color,1,2,2,5,1);
      }
      
      public function set _6220(param1:Number) : void
      {
         if(this._6216 == param1)
         {
            return;
         }
         this._6216 = param1;
         this._6212();
      }
      
      public function set _6219(param1:Number) : void
      {
         if(this._6217 == param1)
         {
            return;
         }
         this._6217 = param1;
         this._6212();
      }
      
      public function set displayVO(param1:_70) : void
      {
         if(this._6223 != param1)
         {
            if(Boolean(this._6223) && Boolean(this._6223._2104))
            {
               this._6223._2104._5725(this);
            }
            this._6223 = param1;
            if(Boolean(this._6223) && this._6223._2104 != null)
            {
               this._6223._2104._5735(this);
            }
            else
            {
               this._5724 = null;
            }
         }
      }
      
      private function get _6211() : _528
      {
         return _1407.getInstance(_528) as _528;
      }
      
      public function dispose() : void
      {
      }
   }
}

