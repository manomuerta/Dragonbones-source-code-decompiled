package _14123
{
   import _1045.Button;
   import _1045.Group;
   import _1045.Label;
   import _1185._1197;
   import _97._125;
   import egret.utils.tr;
   
   public class _14122 extends _14126
   {
      public var _7314:Label;
      
      public var _3761:Button;
      
      public var _12889:Label;
      
      public var _12888:Button;
      
      public function _14122()
      {
         this._7314 = new Label();
         this._3761 = new Button();
         this._12889 = new Label();
         this._12888 = new Button();
         super();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._7314.text = tr("Setting.User");
         this._7314.alpha = _7319;
         this._3761.label = tr("Setting.Login");
         this._3761.height = 26;
         this._3761.minWidth = _14948;
         this._12889.percentWidth = 100;
         this._12889.text = tr("Setting.authorizationText");
         this._12889.alpha = _7319;
         this._12888.label = tr("Setting.RevokeLicence");
         this._12888.height = 26;
         var _loc1_:Group = _125._2413(10);
         _loc1_.percentWidth = 100;
         _loc1_.addElement(this._7314);
         _loc1_.addElement(this._3761);
         _loc1_.addElement(this._12889);
         _loc1_.addElement(this._12888);
         _1197(_loc1_.layout)._2419 = 15;
         _2512.addElement(_12890(tr("Setting.curAccount")));
         _2512.addElement(_loc1_);
      }
   }
}

