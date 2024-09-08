package _676
{
   import _51._52;
   import _703._702;
   import _703._704;
   import _81._84;
   
   public class _684 extends _704
   {
      public function _684()
      {
         super();
      }
      
      public static function _3996(param1:_702, param2:_52) : _684
      {
         var _loc3_:_684 = new _684();
         _loc3_._1836 = param2;
         if(param1 is _684)
         {
            _loc3_.parentBone = param1 as _684;
         }
         else
         {
            _loc3_.parent = param1;
         }
         return _loc3_;
      }
      
      public function addBone(param1:_684) : void
      {
         _84._1979(param1,_5822);
      }
      
      public function _2892(param1:_684) : void
      {
         _84._1958(param1,_5822);
      }
      
      public function addSlot(param1:_700) : void
      {
         _84._1979(param1,_5822);
      }
      
      public function _2932(param1:_700) : void
      {
         _84._1958(param1,_5822);
      }
      
      override public function toString() : String
      {
         return "b" + name;
      }
      
      protected function init() : void
      {
      }
      
      public function get _1836() : _52
      {
         return _3670 as _52;
      }
      
      public function set _1836(param1:_52) : void
      {
         if(_3670 == param1)
         {
            return;
         }
         _3670 = param1;
         this.init();
      }
      
      public function get parentBone() : _684
      {
         return _parent as _684;
      }
      
      public function set parentBone(param1:_684) : void
      {
         if(this.parentBone == param1)
         {
            return;
         }
         if(this.parentBone)
         {
            this.parentBone._2892(this);
         }
         _parent = param1;
         if(this.parentBone)
         {
            this.parentBone.addBone(this);
         }
      }
   }
}

