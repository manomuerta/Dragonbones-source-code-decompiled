package _127
{
   import _1045.Group;
   import _1045._1105;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Shape;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class _14041 extends Group
   {
      private var content:Shape;
      
      private var bitmap:Bitmap;
      
      private var _7240:int;
      
      private var _7239:int;
      
      private var w:int;
      
      private var h:int;
      
      private var _14357:_1105;
      
      private var _14356:_1105;
      
      private var pivot:Point;
      
      private var _14361:Array;
      
      public var origin:int;
      
      public function _14041(param1:int, param2:int)
      {
         this._14361 = [];
         super();
         this.w = param1;
         this.h = param2;
         this.width = this.w;
         this.height = this.h;
         this._7240 = this.w / 3;
         this._7239 = this.h / 3;
         this.pivot = new Point(this._7240 / 2,this._7239 / 2);
         this._14358();
         this._14360();
      }
      
      private function _14358() : void
      {
         var _loc2_:int = 0;
         var _loc3_:GridVO = null;
         var _loc1_:int = 0;
         while(_loc1_ < 3)
         {
            this._14361[_loc1_] = [];
            _loc2_ = 0;
            while(_loc2_ < 3)
            {
               _loc3_ = new GridVO();
               _loc3_._2166 = _loc1_ * this._7240;
               _loc3_._2167 = _loc2_ * this._7239;
               _loc3_.origin = _loc1_ * 3 + _loc2_;
               this._14361[_loc1_][_loc2_] = _loc3_;
               _loc2_++;
            }
            _loc1_++;
         }
      }
      
      private function _14359(param1:int, param2:int) : GridVO
      {
         if(param1 >= 3)
         {
            param1 = 2;
         }
         if(param2 >= 3)
         {
            param2 = 2;
         }
         var _loc3_:GridVO = this._14361[param1][param2];
         if(!_loc3_)
         {
            return null;
         }
         return _loc3_;
      }
      
      private function _14355(param1:int) : GridVO
      {
         var _loc3_:int = 0;
         var _loc4_:GridVO = null;
         var _loc2_:int = 0;
         while(_loc2_ < 3)
         {
            _loc3_ = 0;
            while(_loc3_ < 3)
            {
               _loc4_ = this._14361[_loc2_][_loc3_];
               if(_loc4_.origin == param1)
               {
                  return _loc4_;
               }
               _loc3_++;
            }
            _loc2_++;
         }
         return null;
      }
      
      private function _14360() : void
      {
         this.addEventListener(MouseEvent.MOUSE_OVER,this._14351);
         this.addEventListener(MouseEvent.MOUSE_OUT,this._14352);
         this.addEventListener(MouseEvent.CLICK,this._14353);
      }
      
      override protected function _2438() : void
      {
         super._2438();
         var _loc1_:BitmapData = new BitmapData(this.width,this.height,true,16777215);
         this.content = new Shape();
         this.content.graphics.lineStyle(2,15329769);
         this.content.graphics.drawRect(0,0,this.width,this.height);
         this.content.graphics.endFill();
         _loc1_.draw(this.content);
         var _loc2_:int = 1;
         while(_loc2_ < 3)
         {
            this.content.graphics.clear();
            this.content.graphics.lineStyle(1,15329769);
            this.content.graphics.moveTo(0,this._7239 * _loc2_);
            this.content.graphics.lineTo(this.w,this._7239 * _loc2_);
            _loc1_.draw(this.content);
            this.content.graphics.clear();
            this.content.graphics.lineStyle(1,15329769);
            this.content.graphics.moveTo(this._7240 * _loc2_,0);
            this.content.graphics.lineTo(this._7240 * _loc2_,this.h);
            _loc1_.draw(this.content);
            _loc2_++;
         }
         this.bitmap = new Bitmap(_loc1_);
         var _loc3_:_1105 = new _1105();
         _loc3_.source = this.bitmap;
         this.addElement(_loc3_);
         this._14357 = new _1105();
         this._14357.graphics.lineStyle(1,7196319);
         this._14357.graphics.drawRect(0,0,this._7239,this._7240);
         this._14357.graphics.endFill();
         this._14357.visible = false;
         this.addElement(this._14357);
         this._14356 = new _1105();
         this._14356.graphics.beginFill(15329769);
         this._14356.graphics.drawCircle(0,0,4.5);
         this._14356.graphics.endFill();
         this._14356.x = this.pivot.x - this._14356.width / 2;
         this._14356.y = this.pivot.y - this._14356.height / 2;
         this.addElement(this._14356);
      }
      
      private function _14351(param1:MouseEvent) : void
      {
         if(!this.hasEventListener(MouseEvent.MOUSE_MOVE))
         {
            this.addEventListener(MouseEvent.MOUSE_MOVE,this._14350);
         }
      }
      
      private function _14350(param1:MouseEvent) : void
      {
         var _loc2_:GridVO = this._14359(int(param1.localX / this._7240),int(param1.localY / this._7239));
         this._14357.visible = true;
         this._14357.x = _loc2_._2166;
         this._14357.y = _loc2_._2167;
      }
      
      private function _14352(param1:MouseEvent) : void
      {
         this.removeEventListener(MouseEvent.MOUSE_MOVE,this._14350);
         this._14357.visible = false;
      }
      
      private function _14353(param1:MouseEvent) : void
      {
         var _loc2_:GridVO = this._14359(int(param1.localX / this._7240),int(param1.localY / this._7239));
         this._14354(_loc2_.origin);
      }
      
      public function _14354(param1:int) : void
      {
         this.origin = param1;
         var _loc2_:GridVO = this._14355(param1);
         this._14356.x = _loc2_._2166 - this._14356.width / 2 + this._7240 / 2;
         this._14356.y = _loc2_._2167 - this._14356.height / 2 + this._7239 / 2;
      }
   }
}

class GridVO
{
   public var _2166:int;
   
   public var _2167:int;
   
   public var origin:int;
   
   public function GridVO()
   {
      super();
   }
}

