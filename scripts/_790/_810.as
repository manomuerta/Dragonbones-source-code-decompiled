package _790
{
   import _1045.Group;
   import _1045.Label;
   import _644._645;
   import _644._646;
   import _81._86;
   import _81._91;
   import _97._100;
   import egret.utils.tr;
   import flash.display.Graphics;
   import flash.geom.Point;
   import flash.text.TextFormatAlign;
   
   public class _810 extends Group
   {
      private var _6114:Vector.<_645>;
      
      private var _6119:Graphics;
      
      private var _6115:Vector.<_791>;
      
      private var _6118:Vector.<_791>;
      
      private var _6121:_91;
      
      private var _6123:_791;
      
      private var _6120:Group;
      
      private var _3780:Vector.<_91>;
      
      public var _6124:Label;
      
      public function _810()
      {
         super();
         this._6123 = new _791(_100._2258);
         this._6120 = new Group();
         addElement(this._6120);
         this._6115 = new Vector.<_791>();
         this._6118 = new Vector.<_791>();
         this._6124 = new Label();
         this._6124.textColor = 10066329;
         this._6124.size = 30;
         this._6124.width = 400;
         this._6124.height = 200;
         this._6124.textAlign = TextFormatAlign.CENTER;
         this._6124.text = tr("NewComicWindow.tip");
         this._6124.y = 200;
      }
      
      public function _5100(param1:Number) : void
      {
         this._6124.x = (param1 - this._6124.width) / 2;
         addElement(this._6124);
      }
      
      public function _5101() : void
      {
         if(this._6124.parent)
         {
            removeElement(this._6124);
         }
      }
      
      public function set _4035(param1:Vector.<_645>) : void
      {
         this._6114 = param1;
         this._5077();
      }
      
      public function refresh() : void
      {
         this._5077();
         this._5069();
      }
      
      public function _5077() : void
      {
         var _loc2_:int = 0;
         this._6119 = this.graphics;
         this._6119.clear();
         if(this._6114 == null)
         {
            return;
         }
         var _loc1_:int = 0;
         _loc1_ = 0;
         _loc2_ = int(this._6114.length);
         while(_loc1_ < _loc2_)
         {
            this._6117(this._6114[_loc1_]);
            _loc1_++;
         }
      }
      
      private function _6117(param1:_645) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_646 = null;
         var _loc5_:_86 = null;
         var _loc6_:Point = null;
         var _loc7_:Vector.<Point> = null;
         var _loc8_:Array = null;
         var _loc9_:Point = null;
         var _loc10_:Point = null;
         var _loc11_:Point = null;
         if(param1.tracks.length > 0)
         {
            _loc7_ = new Vector.<Point>();
            _loc8_ = [];
            _loc2_ = 0;
            _loc3_ = int(param1.tracks.length);
            while(_loc2_ < _loc3_)
            {
               _loc4_ = param1.tracks[_loc2_];
               if(this._3780.indexOf(_loc4_) != -1)
               {
                  _loc8_.push(_loc2_);
               }
               _loc9_ = new Point();
               _loc5_ = _loc4_.transform;
               _loc9_.x = _loc5_.x;
               _loc9_.y = _loc5_.y;
               _loc7_.push(_loc9_);
               if(_loc6_ == null && _loc4_.tweens && _loc4_.tweens.length > 0)
               {
                  _loc6_ = new Point();
                  _loc5_ = _loc4_.tweens[0]._1836.globalTransform;
                  _loc6_.x = _loc5_.x;
                  _loc6_.y = _loc5_.y;
               }
               _loc2_++;
            }
            if(_loc6_)
            {
               this._6119.lineStyle(1,16711680);
               (_loc10_ = new Point()).x = _loc6_.x;
               _loc10_.y = _loc6_.y;
               _loc11_ = new Point();
               this._6119.moveTo(_loc6_.x,_loc6_.y);
               _loc2_ = 0;
               _loc3_ = int(_loc7_.length);
               while(_loc2_ < _loc3_)
               {
                  _loc11_.x = _loc7_[_loc2_].x;
                  _loc11_.y = _loc7_[_loc2_].y;
                  if(_loc8_.indexOf(_loc2_) == -1)
                  {
                     this._6100(this._6119,_loc10_,_loc11_);
                  }
                  else
                  {
                     this._6107(this._6119,_loc10_,_loc11_);
                  }
                  _loc10_.x = _loc11_.x;
                  _loc10_.y = _loc11_.y;
                  _loc2_++;
               }
            }
         }
      }
      
      private function _6107(param1:Graphics, param2:Point, param3:Point) : void
      {
         graphics.moveTo(param2.x,param2.y);
         param1.lineTo(param3.x,param3.y);
      }
      
      private function _6100(param1:Graphics, param2:Point, param3:Point, param4:int = 4) : void
      {
         var _loc11_:int = 0;
         var _loc5_:int = param3.x - param2.x;
         var _loc6_:int = param3.y - param2.y;
         var _loc7_:int = Math.abs(_loc5_) > Math.abs(_loc6_) ? int(Math.abs(_loc5_)) : int(Math.abs(_loc6_));
         var _loc8_:int = _loc7_ / param4;
         var _loc9_:Number = _loc5_ / _loc8_;
         var _loc10_:Number = _loc6_ / _loc8_;
         if(_loc8_ <= 1)
         {
            this._6107(param1,param2,param3);
         }
         else
         {
            _loc11_ = 1;
            while(_loc11_ < _loc8_)
            {
               param1.moveTo(param2.x + _loc9_ * (_loc11_ - 1),param2.y + _loc10_ * (_loc11_ - 1));
               param1.lineTo(param2.x + _loc9_ * _loc11_,param2.y + _loc10_ * _loc11_);
               _loc11_ += 2;
            }
         }
      }
      
      public function set _5085(param1:_91) : void
      {
         if(Boolean(this._3780) && this._3780.indexOf(param1) != -1)
         {
            return;
         }
         if(this._6121 != param1)
         {
            this._6121 = param1;
            this._6123.target = this._6121;
            if(this._6121)
            {
               addElement(this._6123);
            }
            else
            {
               removeElement(this._6123);
            }
         }
      }
      
      public function _5069() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc1_ = 0;
         _loc2_ = int(this._6118.length);
         while(_loc1_ < _loc2_)
         {
            this._6118[_loc1_]._6037();
            _loc1_++;
         }
         if(Boolean(this._6121) && Boolean(this._6123))
         {
            this._6123._6037();
         }
      }
      
      public function _2986(param1:Vector.<_91>) : void
      {
         var _loc2_:_791 = null;
         this._3780 = param1;
         if((param1 == null || param1.length == 0) && this._6118.length == 0)
         {
            return;
         }
         this._6122();
         var _loc3_:int = 0;
         var _loc4_:int = int(param1.length);
         while(_loc3_ < _loc4_)
         {
            _loc2_ = this._6116();
            _loc2_.target = param1[_loc3_];
            this._6120.addElement(_loc2_);
            this._6118.push(_loc2_);
            _loc3_++;
         }
         if(this._3780 && this._6121 && this._3780.indexOf(this._6121) != -1)
         {
            this._5085 = null;
         }
         this._5077();
      }
      
      private function _6122() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc1_ = 0;
         _loc2_ = int(this._6118.length);
         while(_loc1_ < _loc2_)
         {
            this._6118[_loc1_].target = null;
            this._6115.push(this._6118[_loc1_]);
            _loc1_++;
         }
         this._6118.length = 0;
         this._6120._2426();
      }
      
      private function _6116() : _791
      {
         if(this._6115.length > 0)
         {
            return this._6115.pop();
         }
         return new _791(_100._2257);
      }
   }
}

