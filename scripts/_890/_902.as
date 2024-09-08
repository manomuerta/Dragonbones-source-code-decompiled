package _890
{
   import _1045.Group;
   import _1045._1105;
   import flash.filesystem.File;
   
   public class _902 extends _891
   {
      private var group:Group;
      
      public var _6493:_1105;
      
      public function _902()
      {
         super();
         this.skinName = _903;
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         _6487.minHeight = 40;
         if(param1)
         {
            _6487.text = param1.name;
            if(File.applicationStorageDirectory.resolvePath("plugins/" + param1.name + "/" + param1.icon).exists)
            {
               this._6493.source = File.applicationStorageDirectory.resolvePath("plugins/" + param1.name + "/" + param1.icon).url;
            }
            else
            {
               this._6493.source = File.applicationDirectory.resolvePath("assets/icon/32.png").url;
            }
         }
      }
      
      override public function set selected(param1:Boolean) : void
      {
         super.selected = param1;
      }
   }
}

