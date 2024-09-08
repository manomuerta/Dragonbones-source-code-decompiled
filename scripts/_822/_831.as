package _822
{
   import _97._100;
   import egret.core._1140;
   import flash.filters.GlowFilter;
   
   public class _831 extends _1140
   {
      private static var glowFilter:GlowFilter = new GlowFilter(0,1,3,3,2,2);
      
      private static var boneColor:Object = {
         "up":_100._2266,
         "over":_100._2262,
         "down":_100._2261
      };
      
      private static var _6234:Vector.<_831> = new Vector.<_831>();
      
      private var _length:Number = 0;
      
      private var _6203:String = "up";
      
      private var _6208:Boolean = true;
      
      public function _831()
      {
         super();
         width = 0;
         height = 0;
         alpha = 0.8;
      }
      
      public static function create() : _831
      {
         var _loc1_:_831 = _6234.pop();
         if(_loc1_)
         {
            return _loc1_;
         }
         return new _831();
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         if(this._6208)
         {
            this._6208 = false;
            this.draw();
         }
      }
      
      private function draw() : void
      {
         var _loc1_:int = Math.round(this._length);
         graphics.clear();
         if(_loc1_ <= 10)
         {
            graphics.beginFill(boneColor[this._6203]);
            graphics.drawCircle(0,0,5);
            graphics.endFill();
         }
         else
         {
            graphics.lineStyle(1,boneColor[this._6203]);
            graphics.moveTo(0,0);
            graphics.lineTo(_loc1_,0);
            graphics.moveTo(_loc1_ - 15,5);
            graphics.lineTo(_loc1_ - 5,0);
            graphics.moveTo(_loc1_ - 15,-5);
            graphics.lineTo(_loc1_ - 5,0);
         }
      }
      
      public function get _2080() : String
      {
         return this._6203;
      }
      
      public function set _2080(param1:String) : void
      {
         if(this._6203 == param1)
         {
            return;
         }
         this._6203 = param1;
         this._6208 = true;
         invalidateDisplayList();
      }
      
      public function get length() : Number
      {
         return this._length;
      }
      
      public function set length(param1:Number) : void
      {
         if(this._length == param1)
         {
            return;
         }
         this._length = param1;
         this._6208 = true;
         invalidateDisplayList();
      }
      
      public function destroy() : void
      {
         _6234.push(this);
      }
   }
}

