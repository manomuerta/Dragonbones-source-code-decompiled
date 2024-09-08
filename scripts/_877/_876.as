package _877
{
   import _1045.Group;
   import _652._655;
   import _658._659;
   import _822._832;
   import _859.LibraryImage;
   import egret.core._1140;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class _876 extends Group
   {
      private static const POINT_SIZE:Number = 3;
      
      private static const SELECT_POINT_SIZE:Number = 4;
      
      private static const EDGE_STYLE_OUTLINE:int = 0;
      
      private static const EDGE_STYLE_AUTO:int = 1;
      
      private static const EDGE_STYLE_USER:int = 2;
      
      private static const EDGE_STYLE_OVER:int = 3;
      
      private static const EDGE_STYLE_DELETE:int = 4;
      
      private static const EDGE_STYLE_RANGE:int = 5;
      
      private static const EDGE_STYLE_CLOSE:int = 6;
      
      private static const EDGE_STYLE_HELP:int = 7;
      
      private static const EDGE_STYLE_SELECT:int = 8;
      
      private static const EDGE_STYLE_SELECT_OUTLINE:int = 9;
      
      private static const COLOR_EDGE_AUTO:uint = 10066329;
      
      private static const COLOR_EDGE_OUTLINE:uint = 65535;
      
      private static const COLOR_EDGE_USER:uint = 13612094;
      
      private static const COLOR_EDGE_OVER:uint = 16777215;
      
      private static const COLOR_EDGE_DELETE:uint = 16711680;
      
      private static const COLOR_EDGE_RANGE:uint = 16777215;
      
      private static const COLOR_EDGE_CLOSE:uint = 13421772;
      
      private static const COLOR_VERTEX_UNSELECT:uint = 10066329;
      
      private static const COLOR_VERTEX_NORMAL:uint = 65535;
      
      private static const COLOR_VERTEX_OVER:uint = 16777215;
      
      private static const COLOR_VERTEX_DELETE:uint = 16711680;
      
      private static const COLOR_VERTEX_SELECT:uint = 65534;
      
      private static const EDGE_THICK:Number = 3;
      
      private var _4761:_659;
      
      private var _6407:_1140;
      
      private var _6393:LibraryImage;
      
      private var _6390:uint = 65535;
      
      private var _1857:Number = 1;
      
      private var _6402:Number = 3;
      
      private var _6387:_832;
      
      private var _6389:Point;
      
      private var _4235:Point;
      
      public function _876()
      {
         super();
         this._6407 = new _1140();
         this._6387 = new _832();
         this._6387.visible = false;
         this._4235 = new Point();
      }
      
      public function get model() : _659
      {
         return this._4761;
      }
      
      public function set model(param1:_659) : void
      {
         if(this._4761 != null)
         {
            this._4761.removeEventListener(Event.CHANGE,this._6406);
         }
         this._4761 = param1;
         if(this._4761)
         {
            this._4761.addEventListener(Event.CHANGE,this._6406);
            if(this._6393 == null)
            {
               this._6393 = new LibraryImage();
               addElement(this._6393);
            }
            this._6393.visible = true;
            this._6393._2104 = this._4761.vo._2104;
            addElement(this._6407);
            addElement(this._6387);
            this._3173();
         }
         else
         {
            if(this._6393)
            {
               this._6393.visible = false;
            }
            if(Boolean(this._6407) && Boolean(this._6407.parent))
            {
               this._6407.graphics.clear();
            }
         }
      }
      
      public function _4312() : void
      {
         if(Boolean(this._6393) && Boolean(this._4761))
         {
            this._6393._2104 = this._4761.vo._2104;
         }
      }
      
      private function _6406(param1:Event) : void
      {
         _2466();
      }
      
      override protected function _2476() : void
      {
         super._2476();
         if(this._4761)
         {
            this._3173();
            this._4761.invalid = false;
         }
      }
      
      public function _4349(param1:Number, param2:Number) : void
      {
         var _loc3_:Point = new Point(param1,param2);
         this._6389 = globalToLocal(_loc3_);
         this._6387.frameX = this._6389.x;
         this._6387.frameY = this._6389.y;
         this._6387.visible = true;
      }
      
      public function _4347(param1:Number, param2:Number) : void
      {
         var _loc3_:Point = new Point(param1,param2);
         var _loc4_:Point = globalToLocal(_loc3_);
         var _loc5_:Number = _loc4_.x - this._6389.x;
         var _loc6_:Number = _loc4_.y - this._6389.y;
         var _loc7_:* = _loc5_ < 0;
         var _loc8_:* = _loc6_ < 0;
         this._6387.frameX = this._6389.x;
         this._6387.frameY = this._6389.y;
         this._6387.frameWidth = _loc5_;
         this._6387.frameHeight = _loc6_;
      }
      
      public function _4340() : void
      {
         this._6387.frameWidth = 1;
         this._6387.frameHeight = 1;
         this._6387.visible = false;
      }
      
      private function _3173() : void
      {
         this._6407.graphics.clear();
         this._6404();
         this._6395();
         this._6400();
         this._6399();
         this._6394();
         this._6401();
         this._11171();
         this._6398();
         this._6386();
         this._6397();
         this._6385();
         this._6391();
         this._6384();
      }
      
      private function _6404() : void
      {
         this._6396(EDGE_STYLE_RANGE);
         this._6407.graphics.moveTo(-this._4761.width / 2,-this._4761.height / 2);
         this._6407.graphics.lineTo(-this._4761.width / 2,this._4761.height / 2);
         this._6407.graphics.lineTo(this._4761.width / 2,this._4761.height / 2);
         this._6407.graphics.lineTo(this._4761.width / 2,-this._4761.height / 2);
         this._6407.graphics.lineTo(-this._4761.width / 2,-this._4761.height / 2);
      }
      
      private function _6395() : void
      {
         var _loc1_:_655 = null;
         this._6396(EDGE_STYLE_AUTO);
         var _loc2_:int = 0;
         var _loc3_:int = int(this._4761.triangles.length);
         while(_loc2_ < _loc3_)
         {
            _loc1_ = this._4761.triangles[_loc2_];
            this._6405(_loc1_._4260,_loc1_.bp);
            this._6405(_loc1_.bp,_loc1_.cp);
            this._6405(_loc1_.cp,_loc1_._4260);
            _loc2_++;
         }
      }
      
      private function _6401() : void
      {
         this._6396(EDGE_STYLE_OUTLINE);
         var _loc1_:int = 0;
         var _loc2_:int = int(this._4761.outline.length);
         while(_loc1_ < _loc2_)
         {
            this._6405(this._4761.outline[_loc1_],this._4761.outline[_loc1_ + 1]);
            _loc1_ += 2;
         }
      }
      
      private function _6400() : void
      {
         this._6396(EDGE_STYLE_USER);
         var _loc1_:int = 0;
         var _loc2_:int = int(this._4761.userEdges.length);
         while(_loc1_ < _loc2_)
         {
            this._6405(this._4761.userEdges[_loc1_],this._4761.userEdges[_loc1_ + 1]);
            _loc1_ += 2;
         }
      }
      
      private function _6399() : void
      {
         if(this._4761._5712[0])
         {
            this._6396(EDGE_STYLE_HELP);
            this._6405(this._4761._5712[0],this._4761._5712[1]);
         }
      }
      
      private function _6394() : void
      {
         if(Boolean(this._4761._5750[0]) && Boolean(this._4761._5750[1]))
         {
            this._6396(EDGE_STYLE_CLOSE);
            this._6405(this._4761._5750[0],this._4761._5750[1]);
         }
      }
      
      private function _11171() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(Boolean(this._4761._11160) && this._4761._11160.length > 0)
         {
            this._6396(EDGE_STYLE_SELECT);
            _loc1_ = 0;
            _loc2_ = int(this._4761._11160.length);
            while(_loc1_ < _loc2_)
            {
               this._6405(this._4761._11160[_loc1_],this._4761._11160[_loc1_ + 1]);
               _loc1_ += 2;
            }
         }
         if(Boolean(this._4761._11158) && this._4761._11158.length > 0)
         {
            this._6396(EDGE_STYLE_SELECT_OUTLINE);
            _loc1_ = 0;
            _loc2_ = int(this._4761._11158.length);
            while(_loc1_ < _loc2_)
            {
               this._6405(this._4761._11158[_loc1_],this._4761._11158[_loc1_ + 1]);
               _loc1_ += 2;
            }
         }
      }
      
      private function _6397() : void
      {
         if(Boolean(this._4761._3823) && this.model._3823.length > 0)
         {
            this._6392(COLOR_VERTEX_UNSELECT);
         }
         else
         {
            this._6392(COLOR_VERTEX_NORMAL);
         }
         var _loc1_:int = 0;
         var _loc2_:int = int(this._4761.vertices.length);
         while(_loc1_ < _loc2_)
         {
            this._6403(this._4761.vertices[_loc1_]);
            _loc1_++;
         }
      }
      
      private function _6386() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this._4761._4266)
         {
            this._6396(EDGE_STYLE_DELETE);
            if(this._4761 && this._4761._4266 && this._4761._4266.length >= 2)
            {
               _loc1_ = 0;
               _loc2_ = int(this._4761._4266.length);
               while(_loc1_ < _loc2_)
               {
                  this._6405(this._4761._4266[_loc1_],this._4761._4266[_loc1_ + 1]);
                  _loc1_ += 2;
               }
            }
         }
      }
      
      private function _6398() : void
      {
         if(this._4761._5713[0])
         {
            this._6396(EDGE_STYLE_OVER);
            this._6405(this._4761._5713[0],this._4761._5713[1]);
         }
      }
      
      private function _6384() : void
      {
         if(this._4761._4265)
         {
            this._6392(COLOR_VERTEX_DELETE);
            this._6403(this._4761._4265);
         }
      }
      
      private function _6391() : void
      {
         if(this._4761._4209)
         {
            this._6392(COLOR_VERTEX_OVER);
            this._6403(this._4761._4209);
         }
      }
      
      private function _6388() : void
      {
         if(this._4761._4358)
         {
            this._6392(COLOR_VERTEX_SELECT);
            this._6403(this._4761._4358);
         }
      }
      
      private function _6385() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(Boolean(this._4761._3823) && this._4761._3823.length > 0)
         {
            this._6392(COLOR_VERTEX_SELECT);
            _loc1_ = 0;
            _loc2_ = int(this._4761._3823.length);
            while(_loc1_ < _loc2_)
            {
               this._6403(this._4761._3823[_loc1_]);
               _loc1_++;
            }
         }
      }
      
      private function _6396(param1:int) : void
      {
         var _loc2_:Number = 0;
         switch(param1)
         {
            case EDGE_STYLE_AUTO:
               this._6407.graphics.lineStyle(0,COLOR_EDGE_AUTO);
               break;
            case EDGE_STYLE_OUTLINE:
               this._6407.graphics.lineStyle(0,COLOR_EDGE_OUTLINE);
               break;
            case EDGE_STYLE_USER:
               this._6407.graphics.lineStyle(0,COLOR_EDGE_USER);
               break;
            case EDGE_STYLE_OVER:
               _loc2_ = EDGE_THICK / this._1857;
               if(_loc2_ < 1)
               {
                  _loc2_ = 1;
               }
               this._6407.graphics.lineStyle(_loc2_,COLOR_EDGE_OVER);
               break;
            case EDGE_STYLE_DELETE:
               _loc2_ = EDGE_THICK / this._1857;
               if(_loc2_ < 1)
               {
                  _loc2_ = 1;
               }
               this._6407.graphics.lineStyle(_loc2_,COLOR_EDGE_DELETE);
               break;
            case EDGE_STYLE_RANGE:
               this._6407.graphics.lineStyle(0,COLOR_EDGE_RANGE);
               break;
            case EDGE_STYLE_CLOSE:
               this._6407.graphics.lineStyle(0,COLOR_EDGE_CLOSE);
               break;
            case EDGE_STYLE_HELP:
               this._6407.graphics.lineStyle(0,COLOR_EDGE_USER);
               break;
            case EDGE_STYLE_SELECT:
               _loc2_ = EDGE_THICK / this._1857;
               if(_loc2_ < 1)
               {
                  _loc2_ = 1;
               }
               this._6407.graphics.lineStyle(_loc2_,COLOR_EDGE_USER);
               break;
            case EDGE_STYLE_SELECT_OUTLINE:
               _loc2_ = EDGE_THICK / this._1857;
               if(_loc2_ < 1)
               {
                  _loc2_ = 1;
               }
               this._6407.graphics.lineStyle(_loc2_,COLOR_EDGE_OUTLINE);
         }
      }
      
      private function _6392(param1:uint) : void
      {
         switch(param1)
         {
            case COLOR_VERTEX_NORMAL:
            case COLOR_VERTEX_UNSELECT:
               this._6402 = POINT_SIZE;
               break;
            case COLOR_VERTEX_DELETE:
               this._6402 = SELECT_POINT_SIZE;
               break;
            case COLOR_VERTEX_OVER:
               this._6402 = SELECT_POINT_SIZE;
               break;
            case COLOR_VERTEX_SELECT:
               this._6402 = SELECT_POINT_SIZE;
         }
         this._6390 = param1;
         this._6407.graphics.lineStyle(0,0,0);
      }
      
      private function _6403(param1:Point) : void
      {
         this._6407.graphics.beginFill(this._6390);
         this._6407.graphics.drawCircle(param1.x,param1.y,this._6402 / this._1857);
         this._6407.graphics.endFill();
      }
      
      private function _6405(param1:Point, param2:Point) : void
      {
         this._6407.graphics.moveTo(param1.x,param1.y);
         this._6407.graphics.lineTo(param2.x,param2.y);
      }
      
      public function _6106(param1:Number, param2:Point = null) : void
      {
         var _loc3_:Number = NaN;
         if(this._1857 != param1)
         {
            if(param2 != null)
            {
               this._4235 = globalToLocal(param2);
               _loc3_ = param1 - this._1857;
               this._4235.x *= _loc3_;
               this._4235.y *= _loc3_;
               this.x -= this._4235.x;
               this.y -= this._4235.y;
            }
            this._1857 = param1;
            this.scaleX = this.scaleY = this._1857;
         }
      }
   }
}

