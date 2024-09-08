package _822
{
   import _1045.Group;
   import _639._642;
   import _97._100;
   import egret.core._1140;
   import flash.filters.ColorMatrixFilter;
   import flash.filters.GlowFilter;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class _821 extends Group
   {
      private static var _6205:GlowFilter = new GlowFilter(0,1,3,3,2,2);
      
      private static var _6209:GlowFilter = new GlowFilter(16728064,1,3,3,4,2);
      
      private static var _6201:ColorMatrixFilter = new ColorMatrixFilter([0.7,0,0,0,30,0,0.7,0,0,90,0,0,0.7,0,100,0,0,0,1,0]);
      
      public static var _12962:Boolean = true;
      
      private var boneColor:Object;
      
      private var _length:Number = 0;
      
      private var _6203:String = "up";
      
      private var _6208:Boolean = true;
      
      private var _6202:Boolean = false;
      
      private var _6198:Boolean = false;
      
      private var _6206:Boolean = false;
      
      private var _6210:Array;
      
      private var _6204:Boolean = false;
      
      private var _color:uint = 0;
      
      private var _10417:Number = 1;
      
      private var _14744:Matrix;
      
      private var _14745:Matrix;
      
      private var _14746:_1140;
      
      private var _14747:_1140;
      
      private var _14748:Boolean;
      
      public function _821()
      {
         this.boneColor = {
            "up":_642.getInstance().boneColor,
            "over":_100._2262,
            "down":_100._2261,
            "ik":_100._2267
         };
         super();
         width = 0;
         height = 0;
         alpha = 0.8;
         this._14746 = new _1140();
         addElement(this._14746);
         this.mouseEnabled = false;
         this._6199();
      }
      
      public function _6197(param1:uint) : Boolean
      {
         if(param1 == _100._14268 && this.boneColor["up"] != _642.getInstance().boneColor)
         {
            this.boneColor["up"] = _642.getInstance().boneColor;
            return true;
         }
         if(param1 != _100._14268 && this.boneColor["up"] != param1)
         {
            this.boneColor["up"] = param1;
            return true;
         }
         return false;
      }
      
      public function set _14295(param1:Boolean) : void
      {
         this._14748 = param1;
         this._6200();
      }
      
      public function set _14292(param1:Matrix) : void
      {
         this._14744 = param1;
         this._6200();
      }
      
      public function set _14291(param1:Matrix) : void
      {
         this._14745 = param1;
         this._6200();
      }
      
      public function set _1980(param1:Boolean) : void
      {
         if(this._6202 != param1)
         {
            this._6202 = param1;
            this._6199();
         }
      }
      
      public function set _1957(param1:Boolean) : void
      {
         if(this._6198 != param1)
         {
            this._6198 = param1;
            this._6200();
         }
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
         var _loc2_:uint = 0;
         var _loc3_:Point = null;
         var _loc1_:int = Math.round(this._length);
         this._10417 = 1;
         if(this._6198 && this._6203 == "up")
         {
            _loc2_ = uint(this.boneColor["ik"]);
         }
         else if(this._6204 && this._6203 == "up")
         {
            _loc2_ = this._color;
            this._10417 = 0.5;
         }
         else if(this._6204 && this._6203 == "down")
         {
            _loc2_ = this._color;
         }
         else
         {
            _loc2_ = uint(this.boneColor[this._6203]);
         }
         this._14746.graphics.clear();
         if(_12962)
         {
            this._14746.graphics.lineStyle();
            this._14746.graphics.beginFill(0,0);
            this._14746.graphics.drawCircle(0,0,6);
            if(_loc1_ >= 5)
            {
               this._14746.graphics.drawRect(0,-6,_loc1_ + 1,12);
            }
            this._14746.graphics.endFill();
         }
         this._14746.graphics.lineStyle(1,_loc2_,this._10417);
         this._14746.graphics.beginFill(0,0);
         this._14746.graphics.drawCircle(0,0,5);
         this._14746.graphics.endFill();
         this._14746.graphics.lineStyle(1,_loc2_,this._10417);
         this._14746.graphics.moveTo(0,0);
         this._14746.graphics.lineTo(4,0);
         if(_loc1_ != 0)
         {
            if(_loc1_ <= 10)
            {
               this._14746.graphics.lineStyle(1,_loc2_,this._10417);
               this._14746.graphics.moveTo(0,0);
               this._14746.graphics.lineTo(_loc1_,0);
            }
            else
            {
               this._14746.graphics.lineStyle(1,_loc2_,this._10417);
               this._14746.graphics.moveTo(0,0);
               this._14746.graphics.lineTo(5,0);
               this._14746.graphics.lineStyle(1,_loc2_,int(this._10417));
               this._14746.graphics.beginFill(_loc2_,this._10417);
               this._14746.graphics.moveTo(5,0);
               this._14746.graphics.lineTo(8,4);
               this._14746.graphics.lineTo(_loc1_,0);
               this._14746.graphics.lineTo(8,-4);
               this._14746.graphics.lineTo(5,0);
               this._14746.graphics.endFill();
            }
         }
         if(this._6198)
         {
            this._14746.graphics.lineStyle(1,_loc2_);
            this._14746.graphics.beginFill(_loc2_,0.5);
            this._14746.graphics.drawCircle(0,0,4);
            this._14746.graphics.lineStyle(2,_loc2_);
            this._14746.graphics.moveTo(3,0);
            this._14746.graphics.lineTo(6,0);
            this._14746.graphics.moveTo(0,3);
            this._14746.graphics.lineTo(0,6);
            this._14746.graphics.moveTo(-3,0);
            this._14746.graphics.lineTo(-6,0);
            this._14746.graphics.moveTo(0,-3);
            this._14746.graphics.lineTo(0,-6);
         }
         if(this._14747)
         {
            this._14747.graphics.clear();
         }
         if(this._14748 && this._6202 && this._length > 0)
         {
            _loc3_ = new Point();
            if(this._14747 == null)
            {
               this._14747 = new _1140();
               addElement(this._14747);
               this._14747.mouseChildren = this._14747.mouseEnabled = false;
               this._14747.enabled = false;
            }
            this._14747.graphics.lineStyle(1,_loc2_);
            _loc3_.x = 0;
            _loc3_.y = 0;
            _loc3_ = this._14744.transformPoint(_loc3_);
            this._14747.graphics.moveTo(_loc3_.x,_loc3_.y);
            _loc3_.x = this._length;
            _loc3_.y = 0;
            _loc3_ = this._14744.transformPoint(_loc3_);
            this._14747.graphics.lineTo(_loc3_.x,_loc3_.y);
            this._14747.graphics.lineStyle(1,_100._2267);
            _loc3_.x = 0;
            _loc3_.y = 0;
            _loc3_ = this._14745.transformPoint(_loc3_);
            this._14747.graphics.moveTo(_loc3_.x,_loc3_.y);
            _loc3_.x = this._length;
            _loc3_.y = 0;
            _loc3_ = this._14745.transformPoint(_loc3_);
            this._14747.graphics.lineTo(_loc3_.x,_loc3_.y);
         }
      }
      
      public function _6200() : void
      {
         this._6208 = true;
         invalidateDisplayList();
      }
      
      protected function _6199() : void
      {
         this._6210 = [this._6202 ? _6209 : _6205];
         if(this._6206)
         {
            this._6210.push(_6201);
         }
         if(this._14746)
         {
            this._14746.filters = this._6210;
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
         this._6199();
         this._6200();
      }
      
      public function get _6207() : Boolean
      {
         return this._6206;
      }
      
      public function set _6207(param1:Boolean) : void
      {
         if(this._6206 != param1)
         {
            this._6206 = param1;
            this._6199();
         }
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
         this._6200();
      }
      
      public function _2035() : void
      {
         if(this._6204)
         {
            this._6204 = false;
            this._6200();
         }
      }
      
      public function set color(param1:uint) : void
      {
         if(!this._6204 || this._color != param1)
         {
            this._6204 = true;
            this._color = param1;
            this._6200();
         }
      }
   }
}

