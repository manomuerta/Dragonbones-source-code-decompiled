package _877
{
   import _1045.Group;
   import _652._655;
   import _658._657;
   import _658._659;
   import _658._661;
   import _658._662;
   import _822._832;
   import _859.LibraryImage;
   import egret.core._1140;
   import flash.display.Graphics;
   import flash.events.Event;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class _885 extends Group
   {
      private static const UNIT_MATRIX:Matrix = new Matrix();
      
      private static const POINT_SIZE:Number = 3;
      
      private static const SELECT_POINT_SIZE:Number = 4;
      
      private static const RIG_POINT_SIZE:Number = 6;
      
      private static const SELECT_RIG_POINT_SIZE:Number = 10;
      
      private static const UNSELECT_RIG_POINT_SIZE:Number = 6;
      
      private static const UNSELECT_RIG_POINT_ALPHA:Number = 0.3;
      
      private static const RIG_POINT_ALPHA:Number = 1;
      
      private static const MASK_RADIUS:Number = 150;
      
      private static const EDGE_STYLE_OUTLINE:int = 0;
      
      private static const EDGE_STYLE_AUTO:int = 1;
      
      private static const EDGE_STYLE_USER:int = 2;
      
      private static const EDGE_STYLE_OVER:int = 3;
      
      private static const EDGE_STYLE_DELETE:int = 4;
      
      private static const EDGE_STYLE_SELECT:int = 8;
      
      private static const EDGE_STYLE_SELECT_OUTLINE:int = 9;
      
      private static const EDGE_STYLE_RANGE:int = 5;
      
      private static const EDGE_STYLE_CLOSE:int = 6;
      
      private static const EDGE_STYLE_HELP:int = 7;
      
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
      
      private var _4761:_657;
      
      private var _6407:_1140;
      
      private var _6393:LibraryImage;
      
      private var _6390:uint = 65535;
      
      private var _4235:Point;
      
      private var _6470:Matrix;
      
      private var _1857:Number = 1;
      
      private var _6402:Number = 3;
      
      private var _6475:Number;
      
      private var _6477:Boolean;
      
      private var _6387:_832;
      
      private var _6389:Point;
      
      private var _4210:_659;
      
      private var _11657:Boolean;
      
      private var _11805:Boolean;
      
      private var _11812:Matrix;
      
      private var _11804:_1140;
      
      private var _11823:_1140;
      
      private var _6455:_886;
      
      public function _885()
      {
         this._4235 = new Point();
         super();
         this._6407 = new _1140();
         this._6393 = new LibraryImage();
         addElement(this._6393);
         this._6387 = new _832();
         addElement(this._6387);
         this._6387.visible = false;
         this._6455 = new _886();
         addElement(this._6455);
         this._6455.visible = false;
         this._11804 = new _1140();
         this._11823 = new _1140();
         addElement(this._11823);
         addElement(this._11804);
         this._11823.mask = this._11804;
      }
      
      public function get model() : _657
      {
         return this._4761;
      }
      
      public function set model(param1:_657) : void
      {
         if(this._4761 != null)
         {
            this._4761.removeEventListener(Event.CHANGE,this._6406);
         }
         this._4761 = param1;
         if(this._4761)
         {
            this._4761.scale = this._1857;
            this._4761.addEventListener(Event.CHANGE,this._6406);
            this._6407.x = 0;
            this._6407.y = 0;
            addElement(this._6407);
            addElement(this._6455);
            this._3173();
         }
         else if(this._4210 == null)
         {
            if(this._6393)
            {
               this._6393.visible = false;
            }
            if(Boolean(this._6407) && Boolean(this._6407.parent))
            {
               this._6407.graphics.clear();
            }
            if(this._11823)
            {
               this._11823.graphics.clear();
            }
            if(this._11804)
            {
               this._11804.graphics.clear();
            }
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
      
      public function get canvas() : _1140
      {
         return this._6407;
      }
      
      public function get _2162() : Matrix
      {
         return this._6470;
      }
      
      public function set _5191(param1:Boolean) : void
      {
         if(this._6477 != param1)
         {
            this._6477 = param1;
            _2466();
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
         if(this._4210)
         {
            this._11825();
            this._4210.invalid = false;
         }
         if(Boolean(this._6455) && this._6455.visible)
         {
            this._6455.scaleX = this._6455.scaleY = 1 / this._1857;
         }
      }
      
      private function _3173() : void
      {
         if(this._4761._1837._2112())
         {
            this._6470 = UNIT_MATRIX;
         }
         else
         {
            this._6470 = this._4761._1837._2009;
         }
         this._6407.graphics.clear();
         this._6401();
         this._6400();
         this._11171();
         this._6398();
         this._6397();
         this._6388();
         this._6391();
      }
      
      private function _6401() : void
      {
         var _loc1_:_661 = null;
         var _loc2_:_661 = null;
         this._6396(EDGE_STYLE_OUTLINE);
         var _loc3_:int = 0;
         var _loc4_:int = int(this._4761.outline.length);
         while(_loc3_ < _loc4_)
         {
            _loc1_ = this._4761._5706(this._4761.outline[_loc3_]);
            _loc2_ = this._4761._5706(this._4761.outline[_loc3_ + 1]);
            if(Boolean(_loc1_) && Boolean(_loc2_))
            {
               this._6405(_loc1_,_loc2_);
            }
            _loc3_ += 2;
         }
      }
      
      private function _6400() : void
      {
         var _loc1_:_661 = null;
         var _loc2_:_661 = null;
         this._6396(EDGE_STYLE_USER);
         var _loc3_:int = 0;
         var _loc4_:int = int(this._4761.userEdges.length);
         while(_loc3_ < _loc4_)
         {
            _loc1_ = this._4761._5706(this._4761.userEdges[_loc3_]);
            _loc2_ = this._4761._5706(this._4761.userEdges[_loc3_ + 1]);
            if(Boolean(_loc1_) && Boolean(_loc2_))
            {
               this._6405(_loc1_,_loc2_);
            }
            _loc3_ += 2;
         }
      }
      
      private function _6398() : void
      {
         var _loc1_:_661 = null;
         var _loc2_:_661 = null;
         this._6396(EDGE_STYLE_OVER);
         if(Boolean(this._4761._5713[0]) && Boolean(this._4761._5713[1]))
         {
            _loc1_ = this._4761._5706(this._4761._5713[0]);
            _loc2_ = this._4761._5706(this._4761._5713[1]);
            if(Boolean(_loc1_) && Boolean(_loc2_))
            {
               this._6405(_loc1_,_loc2_);
            }
         }
      }
      
      private function _11171() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:_661 = null;
         var _loc4_:_661 = null;
         this._6396(EDGE_STYLE_SELECT);
         _loc1_ = 0;
         _loc2_ = int(this._4761._11160.length);
         while(_loc1_ < _loc2_)
         {
            _loc3_ = this._4761._5706(this._4761._11160[_loc1_]);
            _loc4_ = this._4761._5706(this._4761._11160[_loc1_ + 1]);
            if(Boolean(_loc3_) && Boolean(_loc4_))
            {
               this._6405(_loc3_,_loc4_);
            }
            _loc1_ += 2;
         }
         this._6396(EDGE_STYLE_SELECT_OUTLINE);
         _loc1_ = 0;
         _loc2_ = int(this._4761._11158.length);
         while(_loc1_ < _loc2_)
         {
            _loc3_ = this._4761._5706(this._4761._11158[_loc1_]);
            _loc4_ = this._4761._5706(this._4761._11158[_loc1_ + 1]);
            if(Boolean(_loc3_) && Boolean(_loc4_))
            {
               this._6405(_loc3_,_loc4_);
            }
            _loc1_ += 2;
         }
      }
      
      private function _6397() : void
      {
         if(Boolean(this.model._3823) && this.model._3823.length > 0)
         {
            this._6392(COLOR_VERTEX_UNSELECT);
         }
         else
         {
            this._6392(COLOR_VERTEX_NORMAL);
         }
         var _loc1_:int = 0;
         var _loc2_:int = int(this._4761._2118.length);
         while(_loc1_ < _loc2_)
         {
            this._6403(this._4761._2118[_loc1_]);
            _loc1_++;
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
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this._4761._3823)
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
               this._6407.graphics.lineStyle(0,COLOR_EDGE_DELETE);
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
               break;
            case EDGE_STYLE_RANGE:
               this._6407.graphics.lineStyle(0,COLOR_EDGE_RANGE);
               break;
            case EDGE_STYLE_CLOSE:
               this._6407.graphics.lineStyle(0,COLOR_EDGE_CLOSE);
         }
      }
      
      private function _6392(param1:uint) : void
      {
         switch(param1)
         {
            case COLOR_VERTEX_NORMAL:
               this._6402 = this._6477 ? RIG_POINT_SIZE : POINT_SIZE;
               this._6475 = RIG_POINT_ALPHA;
               break;
            case COLOR_VERTEX_DELETE:
               this._6402 = this._6477 ? SELECT_RIG_POINT_SIZE : SELECT_POINT_SIZE;
               this._6475 = RIG_POINT_ALPHA;
               break;
            case COLOR_VERTEX_OVER:
               this._6402 = this._6477 ? SELECT_RIG_POINT_SIZE : SELECT_POINT_SIZE;
               this._6475 = RIG_POINT_ALPHA;
               break;
            case COLOR_VERTEX_SELECT:
               this._6402 = this._6477 ? SELECT_RIG_POINT_SIZE : SELECT_POINT_SIZE;
               this._6475 = RIG_POINT_ALPHA;
               break;
            case COLOR_VERTEX_UNSELECT:
               this._6402 = this._6477 ? UNSELECT_RIG_POINT_SIZE : POINT_SIZE;
               this._6475 = UNSELECT_RIG_POINT_ALPHA;
         }
         this._6390 = param1;
         this._6407.graphics.lineStyle(0,0,0);
      }
      
      private function _6473(param1:uint) : Number
      {
         switch(param1)
         {
            case COLOR_VERTEX_NORMAL:
               return POINT_SIZE;
            case COLOR_VERTEX_DELETE:
               return SELECT_POINT_SIZE;
            case COLOR_VERTEX_OVER:
               return SELECT_POINT_SIZE;
            case COLOR_VERTEX_SELECT:
               return SELECT_POINT_SIZE;
            case COLOR_VERTEX_UNSELECT:
               return POINT_SIZE;
            default:
               return POINT_SIZE;
         }
      }
      
      private function _6403(param1:_661) : void
      {
         if(!this._6477)
         {
            this._6476(param1);
         }
         else
         {
            this._6471(param1,this._4761._5714(param1));
         }
      }
      
      private function _6476(param1:Point) : void
      {
         if(param1 && !isNaN(param1.x) && !isNaN(param1.y))
         {
            if(this._11828)
            {
               this._4235 = param1;
            }
            else
            {
               this._4235 = this._6470.transformPoint(param1);
            }
            this._6407.graphics.beginFill(this._6390);
            this._6407.graphics.drawCircle(this._4235.x,this._4235.y,this._6402 / this._1857);
            this._6407.graphics.endFill();
         }
      }
      
      private function _6472(param1:Point, param2:Number) : void
      {
         if(this._11828)
         {
            this._4235 = param1;
         }
         else
         {
            this._4235 = this._6470.transformPoint(param1);
         }
         this._6407.graphics.beginFill(this._6390);
         this._6407.graphics.drawCircle(this._4235.x,this._4235.y,param2 / this._1857);
         this._6407.graphics.endFill();
      }
      
      private function _6471(param1:Point, param2:_662) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc6_:uint = 0;
         var _loc7_:Number = NaN;
         var _loc8_:int = 0;
         if(param2 == null)
         {
            this._6472(param1,this._6473(this._6390));
            return;
         }
         var _loc5_:Number = 0;
         this._4235 = this._6470.transformPoint(param1);
         _loc3_ = 0;
         _loc4_ = int(this._4761.meshRig._2922.length);
         while(_loc3_ < _loc4_)
         {
            _loc7_ = param2._5208(this._4761.meshRig._2922[_loc3_]);
            if(_loc7_ > 0)
            {
               _loc6_ = this._4761._5707(this._4761.meshRig._2922[_loc3_]);
               this._6474(this._4235.x,this._4235.y,this._6402 / this._1857,_loc7_,_loc5_,_loc6_,this._6475);
               _loc5_ += _loc7_;
            }
            _loc3_++;
         }
      }
      
      private function _6405(param1:Point, param2:Point) : void
      {
         if(this._11828)
         {
            this._6407.graphics.moveTo(param1.x,param1.y);
            this._6407.graphics.lineTo(param2.x,param2.y);
         }
         else
         {
            this._4235 = this._6470.transformPoint(param1);
            this._6407.graphics.moveTo(this._4235.x,this._4235.y);
            this._4235 = this._6470.transformPoint(param2);
            this._6407.graphics.lineTo(this._4235.x,this._4235.y);
         }
      }
      
      public function _6106(param1:Number) : void
      {
         if(this._1857 != param1)
         {
            this._1857 = param1;
            this.scaleX = this.scaleY = this._1857;
            if(this._4761)
            {
               this._4761.scale = this._1857;
            }
         }
      }
      
      private function _6474(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number = 1) : void
      {
         var _loc11_:int = 0;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc8_:Graphics = this._6407.graphics;
         _loc8_.beginFill(param6,param7);
         _loc8_.lineStyle(0,param6,0);
         _loc8_.moveTo(param1,param2);
         param4 = 360 * param4;
         param5 = 360 * param5 - 90;
         param4 = Math.abs(param4) > 360 ? 360 : param4;
         var _loc9_:Number = Math.ceil(Math.abs(param4) / 45);
         var _loc10_:Number = param4 / _loc9_;
         _loc10_ = _loc10_ * Math.PI / 180;
         param5 = param5 * Math.PI / 180;
         _loc8_.lineTo(param1 + param3 * Math.cos(param5),param2 + param3 * Math.sin(param5));
         _loc11_ = 1;
         while(_loc11_ <= _loc9_)
         {
            param5 += _loc10_;
            _loc12_ = param5 += _loc10_ - _loc10_ / 2;
            _loc13_ = param1 + param3 / Math.cos(_loc10_ / 2) * Math.cos(_loc12_);
            _loc14_ = param2 + param3 / Math.cos(_loc10_ / 2) * Math.sin(_loc12_);
            _loc15_ = param1 + param3 * Math.cos(param5);
            _loc16_ = param2 + param3 * Math.sin(param5);
            _loc8_.curveTo(_loc13_,_loc14_,_loc15_,_loc16_);
            _loc11_++;
         }
         if(param4 != 360)
         {
            _loc8_.lineTo(param1,param2);
         }
         _loc8_.endFill();
      }
      
      public function get _11828() : Boolean
      {
         return Boolean(this._4210) && !this._11657;
      }
      
      public function get _4238() : _659
      {
         return this._4210;
      }
      
      public function set _4238(param1:_659) : void
      {
         if(this._4210 != null)
         {
            this._4210.removeEventListener(Event.CHANGE,this._6406);
         }
         this._4210 = param1;
         if(this._4210)
         {
            this._4210.addEventListener(Event.CHANGE,this._6406);
            if(this._6393 == null)
            {
               this._6393 = new LibraryImage();
               addElement(this._6393);
            }
            this._6393._2104 = this._4210.vo._2104;
            if(!this._11657)
            {
               this._6393.visible = true;
               this._11812 = this._4210.vo._1760._2009.clone();
               this._6393.x = this._11812.tx;
               this._6393.y = this._11812.ty;
               this._6407.x = this._11812.tx;
               this._6407.y = this._11812.ty;
            }
            else
            {
               this._6393.visible = false;
            }
            addElement(this._6407);
            addElement(this._11823);
            addElement(this._6387);
            addElement(this._6455);
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
            if(this._11823)
            {
               this._11823.graphics.clear();
            }
            if(this._11804)
            {
               this._11804.graphics.clear();
            }
         }
      }
      
      public function get _11656() : Matrix
      {
         return this._11812;
      }
      
      public function get _4324() : _886
      {
         return this._6455;
      }
      
      public function set _11662(param1:Boolean) : void
      {
         if(this._11657 != param1)
         {
            this._11657 = param1;
            this._11805 = true;
            this._11825();
         }
      }
      
      public function _12947() : void
      {
         if(Boolean(this._4210) && Boolean(this._4210._1837))
         {
            if(this._4210._1837._2112())
            {
               this._6470 = UNIT_MATRIX;
            }
            else
            {
               this._6470 = this._4210._1837._2009;
            }
         }
      }
      
      private function _11825() : void
      {
         if(this._4210 == null)
         {
            return;
         }
         if(this._11805)
         {
            this._6393.visible = !this._11657;
            if(!this._11657)
            {
               this._11812 = this._4210.vo._1760._2009.clone();
               this._6393.x = this._11812.tx;
               this._6393.y = this._11812.ty;
               this._6407.x = this._11812.tx;
               this._6407.y = this._11812.ty;
            }
            else
            {
               this._12947();
               this._6407.x = 0;
               this._6407.y = 0;
            }
            this._11805 = false;
         }
         this._6407.graphics.clear();
         if(this._11823)
         {
            this._11823.graphics.clear();
         }
         if(this._11804)
         {
            this._11804.graphics.clear();
         }
         if(!this._11657)
         {
            this._11829();
            this._11824();
            this._11820();
            this._11818();
            this._11817();
            this._11826();
            this._11809();
            this._11821();
            this._11803();
            this._11819();
            this._11801();
            this._11810();
            this._11800();
         }
         else
         {
            this._11827();
            this._11814();
            this._11816();
            this._12735();
            this._11811();
            this._11822();
            this._11806();
            this._11815();
            this._11802();
            this._11813();
            this._11799();
            this._11807();
            this._11797();
         }
      }
      
      private function _11829() : void
      {
         this._6396(EDGE_STYLE_RANGE);
         this._6407.graphics.moveTo(-this._4210.width / 2,-this._4210.height / 2);
         this._6407.graphics.lineTo(-this._4210.width / 2,this._4210.height / 2);
         this._6407.graphics.lineTo(this._4210.width / 2,this._4210.height / 2);
         this._6407.graphics.lineTo(this._4210.width / 2,-this._4210.height / 2);
         this._6407.graphics.lineTo(-this._4210.width / 2,-this._4210.height / 2);
      }
      
      private function _11824() : void
      {
         var _loc1_:_655 = null;
         this._6396(EDGE_STYLE_AUTO);
         var _loc2_:int = 0;
         var _loc3_:int = int(this._4210.triangles.length);
         while(_loc2_ < _loc3_)
         {
            _loc1_ = this._4210.triangles[_loc2_];
            this._6405(_loc1_._4260,_loc1_.bp);
            this._6405(_loc1_.bp,_loc1_.cp);
            this._6405(_loc1_.cp,_loc1_._4260);
            _loc2_++;
         }
      }
      
      private function _11820() : void
      {
         this._6396(EDGE_STYLE_USER);
         var _loc1_:int = 0;
         var _loc2_:int = int(this._4210.userEdges.length);
         while(_loc1_ < _loc2_)
         {
            this._6405(this._4210.userEdges[_loc1_],this._4210.userEdges[_loc1_ + 1]);
            _loc1_ += 2;
         }
      }
      
      private function _11818() : void
      {
         if(this._4210._5712[0])
         {
            this._6396(EDGE_STYLE_HELP);
            this._6405(this._4210._5712[0],this._4210._5712[1]);
         }
      }
      
      private function _11817() : void
      {
         if(Boolean(this._4210._5750[0]) && Boolean(this._4210._5750[1]))
         {
            this._6396(EDGE_STYLE_CLOSE);
            this._6405(this._4210._5750[0],this._4210._5750[1]);
         }
      }
      
      private function _11826() : void
      {
         this._6396(EDGE_STYLE_OUTLINE);
         var _loc1_:int = 0;
         var _loc2_:int = int(this._4210.outline.length);
         while(_loc1_ < _loc2_)
         {
            this._6405(this._4210.outline[_loc1_],this._4210.outline[_loc1_ + 1]);
            _loc1_ += 2;
         }
      }
      
      private function _11809() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(Boolean(this._4210._11160) && this._4210._11160.length > 0)
         {
            this._6396(EDGE_STYLE_SELECT);
            _loc1_ = 0;
            _loc2_ = int(this._4210._11160.length);
            while(_loc1_ < _loc2_)
            {
               this._6405(this._4210._11160[_loc1_],this._4210._11160[_loc1_ + 1]);
               _loc1_ += 2;
            }
         }
         if(Boolean(this._4210._11158) && this._4210._11158.length > 0)
         {
            this._6396(EDGE_STYLE_SELECT_OUTLINE);
            _loc1_ = 0;
            _loc2_ = int(this._4210._11158.length);
            while(_loc1_ < _loc2_)
            {
               this._6405(this._4210._11158[_loc1_],this._4210._11158[_loc1_ + 1]);
               _loc1_ += 2;
            }
         }
      }
      
      private function _11821() : void
      {
         if(this._4210._5713[0])
         {
            this._6396(EDGE_STYLE_OVER);
            this._6405(this._4210._5713[0],this._4210._5713[1]);
         }
      }
      
      private function _11803() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this._4210._4266)
         {
            this._6396(EDGE_STYLE_DELETE);
            if(this._4210 && this._4210._4266 && this._4210._4266.length >= 2)
            {
               _loc1_ = 0;
               _loc2_ = int(this._4210._4266.length);
               while(_loc1_ < _loc2_)
               {
                  this._6405(this._4210._4266[_loc1_],this._4210._4266[_loc1_ + 1]);
                  _loc1_ += 2;
               }
            }
         }
      }
      
      private function _11819() : void
      {
         if(Boolean(this._4210._3823) && this._4210._3823.length > 0)
         {
            this._6392(COLOR_VERTEX_UNSELECT);
         }
         else
         {
            this._6392(COLOR_VERTEX_NORMAL);
         }
         var _loc1_:int = 0;
         var _loc2_:int = int(this._4210.vertices.length);
         while(_loc1_ < _loc2_)
         {
            this._6403(this._4210.vertices[_loc1_]);
            _loc1_++;
         }
      }
      
      private function _11801() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(Boolean(this._4210._3823) && this._4210._3823.length > 0)
         {
            this._6392(COLOR_VERTEX_SELECT);
            _loc1_ = 0;
            _loc2_ = int(this._4210._3823.length);
            while(_loc1_ < _loc2_)
            {
               this._6403(this._4210._3823[_loc1_]);
               _loc1_++;
            }
         }
      }
      
      private function _11810() : void
      {
         if(this._4210._4209)
         {
            this._6392(COLOR_VERTEX_OVER);
            this._6403(this._4210._4209);
         }
      }
      
      private function _11800() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this._4210._4265)
         {
            this._6392(COLOR_VERTEX_DELETE);
            this._6403(this._4210._4265);
         }
         if(this._4210._12695)
         {
            this._6392(COLOR_VERTEX_DELETE);
            _loc1_ = 0;
            _loc2_ = int(this._4210._12695.length);
            while(_loc1_ < _loc2_)
            {
               this._6403(this._4210._12695[_loc1_]);
               _loc1_++;
            }
         }
      }
      
      private function _11813() : void
      {
         if(Boolean(this._4210._3823) && this._4210._3823.length > 0)
         {
            this._6392(COLOR_VERTEX_UNSELECT);
         }
         else
         {
            this._6392(COLOR_VERTEX_NORMAL);
         }
         var _loc1_:int = 0;
         var _loc2_:int = int(this._4210._2118.length);
         while(_loc1_ < _loc2_)
         {
            this._6403(this._4210._2118[_loc1_]);
            _loc1_++;
         }
      }
      
      private function _11822() : void
      {
         var _loc1_:_661 = null;
         var _loc2_:_661 = null;
         this._6396(EDGE_STYLE_OUTLINE);
         var _loc3_:int = 0;
         var _loc4_:int = int(this._4210.outline.length);
         while(_loc3_ < _loc4_)
         {
            _loc1_ = this._4210._5706(this._4210.outline[_loc3_]);
            _loc2_ = this._4210._5706(this._4210.outline[_loc3_ + 1]);
            if(Boolean(_loc1_) && Boolean(_loc2_))
            {
               this._6405(_loc1_,_loc2_);
            }
            _loc3_ += 2;
         }
      }
      
      private function _11802() : void
      {
         var _loc1_:_661 = null;
         var _loc2_:_661 = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(this._4210._4266)
         {
            this._6396(EDGE_STYLE_DELETE);
            if(this._4210 && this._4210._4266 && this._4210._4266.length >= 2)
            {
               _loc3_ = 0;
               _loc4_ = int(this._4210._4266.length);
               while(_loc3_ < _loc4_)
               {
                  _loc1_ = this._4210._5706(this._4210._4266[_loc3_]);
                  _loc2_ = this._4210._5706(this._4210._4266[_loc3_ + 1]);
                  if(Boolean(_loc1_) && Boolean(_loc2_))
                  {
                     this._6405(_loc1_,_loc2_);
                  }
                  _loc3_ += 2;
               }
            }
         }
      }
      
      private function _11797() : void
      {
         var _loc1_:_661 = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this._4210._4265)
         {
            _loc1_ = this._4210._5706(this._4210._4265);
            if(_loc1_)
            {
               this._6392(COLOR_VERTEX_DELETE);
               this._6403(_loc1_);
            }
         }
         if(this._4210._12695)
         {
            this._6392(COLOR_VERTEX_DELETE);
            _loc2_ = 0;
            _loc3_ = int(this._4210._12695.length);
            while(_loc2_ < _loc3_)
            {
               _loc1_ = this._4210._5706(this._4210._12695[_loc2_]);
               if(_loc1_)
               {
                  this._6403(_loc1_);
               }
               _loc2_++;
            }
         }
      }
      
      private function _11814() : void
      {
         var _loc1_:_655 = null;
         var _loc2_:_661 = null;
         var _loc3_:_661 = null;
         var _loc4_:_661 = null;
         this._6396(EDGE_STYLE_AUTO);
         var _loc5_:int = 0;
         var _loc6_:int = int(this._4210.triangles.length);
         while(_loc5_ < _loc6_)
         {
            _loc1_ = this._4210.triangles[_loc5_];
            _loc2_ = this._4210._5706(_loc1_._4260);
            _loc3_ = this._4210._5706(_loc1_.bp);
            _loc4_ = this._4210._5706(_loc1_.cp);
            if(Boolean(_loc2_) && Boolean(_loc3_) && Boolean(_loc4_))
            {
               this._6405(_loc2_,_loc3_);
               this._6405(_loc3_,_loc4_);
               this._6405(_loc4_,_loc2_);
            }
            _loc5_++;
         }
      }
      
      private function _12735() : void
      {
         if(this._4210._5712[0])
         {
            this._6396(EDGE_STYLE_HELP);
            this._6405(this._4210._5712[0],this._4210._5712[1]);
         }
      }
      
      private function _11816() : void
      {
         var _loc1_:_661 = null;
         var _loc2_:_661 = null;
         this._6396(EDGE_STYLE_USER);
         var _loc3_:int = 0;
         var _loc4_:int = int(this._4210.userEdges.length);
         while(_loc3_ < _loc4_)
         {
            _loc1_ = this._4210._5706(this._4210.userEdges[_loc3_]);
            _loc2_ = this._4210._5706(this._4210.userEdges[_loc3_ + 1]);
            if(Boolean(_loc1_) && Boolean(_loc2_))
            {
               this._6405(_loc1_,_loc2_);
            }
            _loc3_ += 2;
         }
      }
      
      private function _11806() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:_661 = null;
         var _loc4_:_661 = null;
         if(Boolean(this._4210._11160) && this._4210._11160.length > 0)
         {
            this._6396(EDGE_STYLE_SELECT);
            _loc1_ = 0;
            _loc2_ = int(this._4210._11160.length);
            while(_loc1_ < _loc2_)
            {
               _loc3_ = this._4210._5706(this._4210._11160[_loc1_]);
               _loc4_ = this._4210._5706(this._4210._11160[_loc1_ + 1]);
               if(Boolean(_loc3_) && Boolean(_loc4_))
               {
                  this._6405(_loc3_,_loc4_);
               }
               _loc1_ += 2;
            }
         }
         if(Boolean(this._4210._11158) && this._4210._11158.length > 0)
         {
            this._6396(EDGE_STYLE_SELECT_OUTLINE);
            _loc1_ = 0;
            _loc2_ = int(this._4210._11158.length);
            while(_loc1_ < _loc2_)
            {
               _loc3_ = this._4210._5706(this._4210._11158[_loc1_]);
               _loc4_ = this._4210._5706(this._4210._11158[_loc1_ + 1]);
               if(Boolean(_loc3_) && Boolean(_loc4_))
               {
                  this._6405(_loc3_,_loc4_);
               }
               _loc1_ += 2;
            }
         }
      }
      
      private function _11815() : void
      {
         var _loc1_:_661 = null;
         var _loc2_:_661 = null;
         if(this._4210._5713[0])
         {
            this._6396(EDGE_STYLE_OVER);
            _loc1_ = this._4210._5706(this._4210._5713[0]);
            _loc2_ = this._4210._5706(this._4210._5713[1]);
            if(Boolean(_loc1_) && Boolean(_loc2_))
            {
               this._6405(_loc1_,_loc2_);
            }
         }
      }
      
      private function _11799() : void
      {
         var _loc1_:_661 = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(Boolean(this._4210._3823) && this._4210._3823.length > 0)
         {
            this._6392(COLOR_VERTEX_SELECT);
            _loc2_ = 0;
            _loc3_ = int(this._4210._3823.length);
            while(_loc2_ < _loc3_)
            {
               _loc1_ = this._4210._5706(this._4210._3823[_loc2_]);
               if(_loc1_)
               {
                  this._6403(_loc1_);
               }
               _loc2_++;
            }
         }
      }
      
      private function _11807() : void
      {
         var _loc1_:_661 = null;
         if(this._4210._4209)
         {
            this._6392(COLOR_VERTEX_OVER);
            _loc1_ = this._4210._5706(this._4210._4209);
            if(_loc1_)
            {
               this._6403(_loc1_);
            }
         }
      }
      
      private function _11811() : void
      {
         var _loc1_:_661 = null;
         var _loc2_:_661 = null;
         if(Boolean(this._4210._5750[0]) && Boolean(this._4210._5750[1]))
         {
            this._6396(EDGE_STYLE_CLOSE);
            _loc1_ = this._4210._5706(this._4210._5750[0]);
            _loc2_ = this._4210._5706(this._4210._5750[1]);
            if(Boolean(_loc1_) && Boolean(_loc2_))
            {
               this._6405(_loc1_,_loc2_);
            }
         }
      }
      
      private function _11827() : void
      {
         var _loc1_:_661 = null;
         if(this._4210._11663 && this._4210._11669.length > 0)
         {
            this._6396(EDGE_STYLE_RANGE);
            this._11823.graphics.lineStyle(0,COLOR_EDGE_RANGE);
            this._11808(this._4210._11669[0],this._4210._11669[1]);
            this._11808(this._4210._11669[1],this._4210._11669[2]);
            this._11808(this._4210._11669[2],this._4210._11669[3]);
            this._11808(this._4210._11669[3],this._4210._11669[0]);
         }
         if(this._4210._4358)
         {
            _loc1_ = this._4210._5706(this._4210._4358);
            if(_loc1_)
            {
               this._11798(_loc1_);
            }
         }
      }
      
      private function _11798(param1:Point) : void
      {
         if(param1 && !isNaN(param1.x) && !isNaN(param1.y))
         {
            if(!this._11828)
            {
               this._4235 = this._6470.transformPoint(param1);
               this._11804.graphics.clear();
               this._11804.graphics.beginFill(16711680,0.5);
               this._11804.graphics.drawCircle(this._4235.x,this._4235.y,MASK_RADIUS);
               this._11804.graphics.endFill();
            }
         }
      }
      
      private function _11808(param1:Point, param2:Point) : void
      {
         if(this._11828)
         {
            this._6407.graphics.moveTo(param1.x,param1.y);
            this._6407.graphics.lineTo(param2.x,param2.y);
         }
         else
         {
            this._4235 = this._6470.transformPoint(param1);
            this._11823.graphics.moveTo(this._4235.x,this._4235.y);
            this._4235 = this._6470.transformPoint(param2);
            this._11823.graphics.lineTo(this._4235.x,this._4235.y);
         }
      }
   }
}

