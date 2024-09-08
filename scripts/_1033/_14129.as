package _1033
{
   import _1045.Group;
   import _1045._1082;
   
   public class _14129 extends Group
   {
      private var _12891:_1082;
      
      private var _12892:_1082;
      
      public function _14129(param1:int = 10)
      {
         super();
         this.percentHeight = 100;
         this.width = param1;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._12891 = new _1082();
         this._12891.width = 1;
         this._12891.percentHeight = 100;
         this._12891.fillColor = 2041905;
         this._12892 = new _1082();
         this._12892.width = 1;
         this._12892.percentHeight = 100;
         this._12892.fillColor = 3357765;
         this._12891.x = int(this.width / 2);
         addElement(this._12891);
         this._12892.x = this._12891.x + 1;
         addElement(this._12892);
      }
   }
}

