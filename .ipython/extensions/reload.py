# ~/.ipython/extensions/
from IPython.core.magic import register_line_magic
import imp


@register_line_magic
def reload(module_str):
    """Reload an IPython extension by its module name."""
    if not module_str:
        raise UsageError('Missing module name.')
    imp.reload(module_str)


def load_ipython_extension(ipython):
    ipython.register_magic_function(reload)