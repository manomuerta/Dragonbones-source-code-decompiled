package _14110
{
   import _1045.Group;
   import _1045.Label;
   import _1529._1528;
   import _1529._1530;
   import _6.Context;
   import egret.core._1140;
   import flash.events.MouseEvent;
   
   public class Ruler extends Group
   {
      public static const HORIZONTAL:int = 0;
      
      public static const VERTICAL:int = 1;
      
      public var _14833:int = 0;
      
      private var bg:_1140;
      
      private var _14742:_1140;
      
      private var _14830:Group;
      
      private var labels:Array;
      
      private var _9747:Boolean;
      
      private var _14829:Group;
      
      private var minSize:Number = 50;
      
      private var maxSize:Number = 100;
      
      private var _14792:Number = 450;
      
      private var _14838:Number = 300;
      
      private var _14836:int = 60;
      
      private var _14831:int = 10;
      
      private var _14839:_1140;
      
      private var _14835:uint;
      
      private var _14832:uint = 3000;
      
      private var _14837:int;
      
      public var backgroundColor:uint = 2699835;
      
      public var _14828:uint = 6710886;
      
      private var group:Group;
      
      public function Ruler(param1:uint = 16)
      {
         super();
         this._14835 = param1;
         this.mouseChildren = false;
         this.mouseEnabled = true;
      }
      
      public function get size() : Number
      {
         return this._14835;
      }
      
      override protected function _2438() : void
      {
         var _loc2_:Label = null;
         super._2438();
         this.group = new Group();
         this.addElement(this.group);
         this.bg = new _1140();
         this.group.addElement(this.bg);
         this._14839 = new _1140();
         this.group.addElement(this._14839);
         this._14742 = new _1140();
         this.group.addElement(this._14742);
         this._14830 = new Group();
         this.group.addElement(this._14830);
         this.labels = [];
         var _loc1_:int = 0;
         while(_loc1_ < this._14836)
         {
            _loc2_ = new Label();
            _loc2_.size = this._14831;
            _loc2_.textColor = 11184810;
            if(this._14833 == 1)
            {
               if(_1528.language == _1530.zh_CN)
               {
                  _loc2_.leading = -1;
               }
               else
               {
                  _loc2_.leading = -3;
               }
            }
            this.labels[_loc1_] = _loc2_;
            this._14830.addElement(_loc2_);
            _loc1_++;
         }
         this._14830.cacheAsBitmap = true;
         this._14829 = new Group();
         this._14829.graphics.clear();
         this._14829.graphics.lineStyle(1,8042752);
         if(this._14833 == 0)
         {
            this._14829.graphics.moveTo(0,0);
            this._14829.graphics.lineTo(0,this._14835);
         }
         else
         {
            this._14829.graphics.moveTo(0,0);
            this._14829.graphics.lineTo(this._14835,0);
         }
         this._14829.graphics.endFill();
         this.addElement(this._14829);
         Context.getInstance().stage.addEventListener(MouseEvent.MOUSE_MOVE,this._14834);
      }
      
      protected function _14834(param1:MouseEvent) : void
      {
         if(this._14833 == 0)
         {
            this._14829.x = this.mouseX < 0 ? 0 : this.mouseX;
         }
         if(this._14833 == 1)
         {
            this._14829.y = this.mouseY < 0 ? 0 : this.mouseY;
         }
      }
      
      public function _14785(param1:Number, param2:Number, param3:Number) : void
      {
         var _loc8_:String = null;
         var _loc9_:String = null;
         var _loc11_:Number = NaN;
         var _loc12_:int = 0;
         var _loc13_:Number = NaN;
         var _loc14_:Label = null;
         var _loc15_:int = 0;
         this.group.x = param1;
         this.group.y = param2;
         if(this.bg)
         {
            this.bg.graphics.clear();
            this.bg.graphics.beginFill(this.backgroundColor);
            this.bg.graphics.drawRect(-param1,-param2,this._14833 == 0 ? this._14832 : this._14835,this._14833 == 0 ? this._14835 : this._14832);
            this.bg.graphics.endFill();
         }
         if(this._14839)
         {
            this._14839.graphics.clear();
            this._14839.graphics.lineStyle(1,this._14828);
            this._14839.graphics.moveTo(-param1 + (this._14833 == 0 ? 0 : this._14835),-param2 + (this._14833 == 0 ? this._14835 : 0));
            this._14839.graphics.lineTo(-param1 + (this._14833 == 0 ? this._14832 : this._14835),-param2 + (this._14833 == 0 ? this._14835 : this._14832));
            this._14839.graphics.endFill();
         }
         var _loc4_:Number = param3 * this.minSize;
         while(_loc4_ < this.minSize)
         {
            _loc4_ *= 2;
         }
         if(_loc4_ > this.maxSize)
         {
            while(_loc4_ > this.maxSize)
            {
               _loc4_ /= 2;
            }
         }
         var _loc5_:Number = _loc4_;
         var _loc6_:Number = _loc4_ / 10;
         if(this._14742)
         {
            this._14837 = int(param3 * 100);
            this._14742.graphics.clear();
            this._14742.graphics.lineStyle(1,this._14828);
            _loc12_ = _loc11_ = -Math.floor((this._14833 == 0 ? param1 : param2) / _loc6_);
            while(_loc12_ < (this._14833 == 0 ? this._14792 : this._14838) + _loc11_)
            {
               if(_loc12_ % 10 == 0)
               {
                  _loc13_ = 0;
               }
               else if(_loc12_ % 2 == 0)
               {
                  _loc13_ = 15;
               }
               else
               {
                  _loc13_ = 17;
               }
               if(this._14833 == 0)
               {
                  this._14742.graphics.moveTo(_loc12_ * _loc6_,_loc13_);
                  this._14742.graphics.lineTo(_loc12_ * _loc6_,this._14835);
               }
               else
               {
                  this._14742.graphics.moveTo(_loc13_,_loc12_ * _loc6_);
                  this._14742.graphics.lineTo(this._14835,_loc12_ * _loc6_);
               }
               _loc12_++;
            }
            this._14742.graphics.endFill();
         }
         var _loc7_:int = 0;
         var _loc10_:int = _loc11_ = -Math.floor((this._14833 == 0 ? param1 : param2) / _loc5_);
         while(_loc10_ < this._14836 + _loc11_)
         {
            _loc14_ = this.labels[_loc7_];
            _loc8_ = String(Math.abs(Math.floor(_loc10_ * _loc5_ / param3)));
            if(this._14833 == 0)
            {
               _loc14_.text = _loc8_;
               _loc14_.x = Math.floor(_loc10_ * _loc6_ * 10);
               _loc14_.y = (this._14835 - this._14831) / 2 - 2;
            }
            else
            {
               _loc9_ = "";
               _loc15_ = 0;
               while(_loc15_ < _loc8_.length)
               {
                  if(_loc15_ < _loc8_.length)
                  {
                     _loc9_ += _loc8_.charAt(_loc15_) + "\n";
                  }
                  else
                  {
                     _loc9_ += _loc8_.charAt(_loc15_);
                  }
                  _loc15_++;
               }
               _loc14_.text = _loc9_;
               _loc14_.x = (this._14835 - this._14831) / 2;
               _loc14_.y = Math.floor(_loc10_ * _loc6_ * 10);
            }
            _loc7_++;
            _loc10_++;
         }
      }
   }
}

