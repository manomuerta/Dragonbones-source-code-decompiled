package _692
{
   import _703._702;
   import _703._704;
   import _724._13550;
   import _81._84;
   
   public class _13549 extends _704
   {
      public function _13549(param1:Object)
      {
         super();
         this._3670 = param1;
      }
      
      public static function _3996(param1:_702, param2:_13550) : _13549
      {
         var _loc3_:_13549 = new _13549(param2);
         if(param1 is _13549 || param1 is _696)
         {
            _loc3_.parentNode = param1;
         }
         else
         {
            _loc3_.parent = param1;
         }
         return _loc3_;
      }
      
      override public function get children() : Array
      {
         return _5822;
      }
      
      override public function get parent() : _702
      {
         return _parent;
      }
      
      override public function set parent(param1:_702) : void
      {
         _parent = param1;
      }
      
      public function get parentNode() : Object
      {
         return _parent;
      }
      
      public function set parentNode(param1:Object) : void
      {
         if(this.parentNode == param1)
         {
            return;
         }
         if(this.parentNode)
         {
            this.parentNode.removeChild(this);
         }
         _parent = param1 as _702;
         if(this.parentNode)
         {
            this.parentNode.addChild(this);
            this.parentNode._5827();
         }
      }
      
      public function addChild(param1:_704) : void
      {
         _84._1979(param1,_5822);
      }
      
      public function removeChild(param1:_704) : void
      {
         _84._1958(param1,_5822);
      }
   }
}

