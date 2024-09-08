package _825
{
   import _11220._11219;
   import _1404._1407;
   import _521._528;
   import _658.Mesh;
   import _658._661;
   import _724._725;
   import _73.BoundingBoxType;
   import _859._860;
   import egret.core._1140;
   import flash.geom.Rectangle;
   
   public class _824 extends _1140 implements _860
   {
      private var _color:uint;
      
      private var _6216:Number = 1;
      
      private var _6217:Number = 1;
      
      private var _6214:Boolean = false;
      
      private var _5741:Boolean;
      
      private var _5740:Boolean;
      
      private var _6215:Number;
      
      private var _6213:Number;
      
      private var _2101:_725;
      
      private var _2123:Mesh;
      
      private var _11383:_11219;
      
      private var _14750:Rectangle;
      
      public function _824()
      {
         super();
         mouseEnabled = false;
      }
      
      public function set _2104(param1:_725) : void
      {
         if(this._2101 != param1)
         {
            if(this._2101 != null)
            {
               this._2101._5725(this);
            }
            this._2101 = param1;
            if(this._2101 != null)
            {
               if(this._2101)
               {
                  this._2101._5735(this);
               }
            }
            else
            {
               this._5724 = null;
            }
         }
         else
         {
            this._6212();
         }
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
      
      public function _6218(param1:Mesh) : void
      {
         this._2123 = param1;
         this._11383 = null;
         this._14750 = null;
      }
      
      public function _11444(param1:_11219) : void
      {
         this._11383 = param1;
         this._2123 = null;
         this._14750 = null;
         visible = true;
         this.draw();
      }
      
      public function _14749(param1:Rectangle) : void
      {
         this._14750 = param1;
         this._11383 = null;
         this._2123 = null;
         visible = true;
         this.draw();
      }
      
      protected function draw() : void
      {
         var _loc1_:_661 = null;
         var _loc2_:_661 = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         graphics.clear();
         if(visible)
         {
            graphics.lineStyle(1,this._color);
            if(this._2123)
            {
               _loc3_ = 0;
               _loc4_ = int(this._2123.outline.length);
               while(_loc3_ < _loc4_)
               {
                  _loc1_ = this._2123._3183(this._2123.outline[_loc3_]);
                  _loc2_ = this._2123._3183(this._2123.outline[_loc3_ + 1]);
                  if(Boolean(_loc1_) && Boolean(_loc2_))
                  {
                     graphics.moveTo(_loc1_.x * this._6216,_loc1_.y * this._6217);
                     graphics.lineTo(_loc2_.x * this._6216,_loc2_.y * this._6217);
                  }
                  _loc3_ += 2;
               }
            }
            else if(this._11383)
            {
               switch(this._11383.type)
               {
                  case BoundingBoxType.POLYGON:
                     _loc3_ = 0;
                     _loc4_ = int(this._11383.vertices.length);
                     while(_loc3_ < _loc4_)
                     {
                        _loc1_ = this._11383.vertices[_loc3_];
                        if(_loc3_ < _loc4_ - 1)
                        {
                           _loc2_ = this._11383.vertices[_loc3_ + 1];
                        }
                        else
                        {
                           _loc2_ = this._11383.vertices[0];
                        }
                        if(Boolean(_loc1_) && Boolean(_loc2_))
                        {
                           graphics.moveTo(_loc1_.x * this._6216,_loc1_.y * this._6217);
                           graphics.lineTo(_loc2_.x * this._6216,_loc2_.y * this._6217);
                        }
                        _loc3_++;
                     }
                     break;
                  case BoundingBoxType.POLYGON:
                  case BoundingBoxType.ELLIPSE:
               }
            }
            else if(this._14750)
            {
               graphics.drawRect(this._14750.x * this._6216,this._14750.y * this._6217,this._14750.width * this._6216,this._14750.height * this._6217);
            }
            else if(this._2101)
            {
               _loc5_ = this._6216 * this._2101.width;
               _loc6_ = this._6217 * this._2101.height;
               _loc7_ = this._6216 * this._2101._2166;
               _loc8_ = this._6217 * this._2101._2167;
               if(!isNaN(_loc5_) && !isNaN(_loc6_) && _loc5_ != 0 && _loc6_ != 0)
               {
                  graphics.drawRect(_loc7_,_loc8_,_loc5_,_loc6_);
               }
            }
         }
      }
      
      protected function _6212() : void
      {
         this._6214 = true;
         _2466();
      }
      
      public function set _5724(param1:Object) : void
      {
         if(param1)
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
      
      private function get _6211() : _528
      {
         return _1407.getInstance(_528) as _528;
      }
      
      public function dispose() : void
      {
      }
   }
}

