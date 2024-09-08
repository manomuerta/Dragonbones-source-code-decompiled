package _1033
{
   import _1045.Group;
   import _1045._1082;
   
   public class _13567 extends Group
   {
      private var _12891:_1082;
      
      private var _12892:_1082;
      
      public function _13567()
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
         this._12891.fillColor = 1580580;
         this._12892 = new _1082();
         this._12892.height = 1;
         this._12892.percentWidth = 100;
         this._12892.fillColor = 2896440;
         addElement(this._12891);
         this._12892.y = 1;
         addElement(this._12892);
      }
   }
}

