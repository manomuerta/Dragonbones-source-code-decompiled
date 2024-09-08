package _935
{
   import _1038._1037;
   import _1045._1084;
   import _1374._1391;
   import _1529._1528;
   import _1529._1530;
   import _579._580;
   import _822._855;
   import _953._960;
   
   public class _938 extends _1084
   {
      protected static var _6681:String = "/assets/button/selector.png";
      
      protected static var _6683:String = "/assets/button/grab.png";
      
      public var _4905:_1391;
      
      public var _4883:_855;
      
      public var stageView:_960;
      
      protected var _6685:_1037;
      
      protected var _6679:Class;
      
      protected var gap:int;
      
      public function _938()
      {
         this._6685 = new _1037();
         super();
         this.gap = _580.gap;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._6687();
         this._6686();
         this._6688();
      }
      
      protected function _6687() : void
      {
         this.stageView = new this._6679();
         this.stageView.percentWidth = 100;
         this.stageView.percentHeight = 100;
         this.addElement(this.stageView);
      }
      
      protected function _6686() : void
      {
         this._4883 = new _855();
         this._4883.height = 24;
         this._4883.right = 5;
         this._4883.top = this.gap;
         this._4883.width = _1528.language == _1530.zh_CN ? 60 : 65;
         this.addElement(this._4883);
      }
      
      protected function _6688() : void
      {
         this._4905 = new _1391();
         this._4905.dataProvider = this._6685;
         this._4905.selectedIndex = 0;
         this._4905.skinName = _943;
         this._4905.itemRenderer = _934;
         this._4905.right = this._4883.width + this._4883.right;
         this._4905.top = this.gap;
         this.addElement(this._4905);
      }
      
      public function _14625(param1:int) : void
      {
         this.gap = param1;
         this._4883.top = param1;
         this._4905.top = param1;
      }
   }
}

