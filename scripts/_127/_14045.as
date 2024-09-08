package _127
{
   import _1045._1084;
   import _1045._1085;
   import _1045._1105;
   
   public class _14045 extends _1084
   {
      public var _2557:_1085;
      
      public var track:_1085;
      
      public function _14045()
      {
         super();
         this.minHeight = 8;
         this.minWidth = 30;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.track = new _1085();
         this.track.skinName = _1251;
         this.track.percentHeight = 100;
         this.track.left = 0;
         this.track.right = 0;
         this.addElement(this.track);
         this._2557 = new _1085();
         this._2557.percentHeight = 100;
         this._2557.skinName = _1250;
         this.addElement(this._2557);
         var _loc1_:_1105 = new _1105();
         _loc1_.graphics.lineStyle(2,1646115);
         _loc1_.graphics.drawRect(0,0,300,8);
         _loc1_.graphics.endFill();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         this.addElement(_loc1_);
      }
   }
}

import _1045._1084;
import _1045._1105;

class _1251 extends _1084
{
   private var _10022:Class;
   
   public function _1251()
   {
      this._10022 = _1251__10022;
      super();
   }
   
   override protected function _2438() : void
   {
      super._2438();
      var _loc1_:_1105 = new _1105();
      _loc1_.source = this._10022;
      _loc1_.percentHeight = _loc1_.percentWidth = 100;
      this.addElement(_loc1_);
   }
}

import _1045._1084;
import _1045._1105;

class _1250 extends _1084
{
   private var _10022:Class;
   
   public function _1250()
   {
      this._10022 = _1250__10022;
      super();
   }
   
   override protected function _2438() : void
   {
      super._2438();
      var _loc1_:_1105 = new _1105();
      _loc1_.source = this._10022;
      _loc1_.percentHeight = _loc1_.percentWidth = 100;
      this.addElement(_loc1_);
   }
}

