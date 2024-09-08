package _953
{
   import _1038._1037;
   import _844._848;
   
   public class _959 extends _960
   {
      public static var _5262:_848 = new _848();
      
      public function _959()
      {
         super();
         _3198 = new _954();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         _4428.addElement(_3198);
      }
      
      override protected function _2476() : void
      {
         if(_6778)
         {
            _3198.dataProvider = new _1037(_6779._1779);
         }
         super._2476();
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         if(_6768)
         {
            _3198.scaleX = _6768.zoom;
            _3198.scaleY = _6768.zoom;
         }
      }
      
      override public function active() : void
      {
         super.active();
         if(!_4428.contains(_5262))
         {
            _4428.addElement(_5262);
         }
      }
      
      override public function dispose() : void
      {
         _3198.dispose();
         _5262.dispose();
         super.dispose();
      }
   }
}

