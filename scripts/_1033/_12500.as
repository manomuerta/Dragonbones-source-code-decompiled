package _1033
{
   import _1045.Group;
   import _1045._1082;
   
   public class _12500 extends Group
   {
      private var _12891:_1082;
      
      private var _12892:_1082;
      
      public function _12500()
      {
         super();
         this.percentWidth = 100;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._12891 = new _1082();
         this._12891.height = 1;
         this._12891.percentWidth = 100;
         this._12891.fillColor = 2041905;
         this._12892 = new _1082();
         this._12892.height = 1;
         this._12892.percentWidth = 100;
         this._12892.fillColor = 3357765;
         addElement(this._12891);
         this._12892.y = 1;
         addElement(this._12892);
      }
   }
}

